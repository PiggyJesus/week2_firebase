import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:week2_firebase/data/mapper/mapper.dart';

import '../../domain/entities/todo_entity.dart';

class DataUnit {
  late final collection = FirebaseFirestore.instance.collection('todos');

  Future<void> addTodo(TodoEntity todo) async {
    try {
      await collection.add({
        'id': (await collection.get()).size,
        'name': todo.name,
        'isCompleted': todo.isCompleted,
        'finishTime': todo.finishTime,
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Firebase add error: ${e.code} ${e.message}");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<TodoEntity>> getCompleted(bool isCompleted) async {
    List<TodoEntity> todos = [];
    try {
      final jsonTodos =
          await collection.where('isCompleted', isEqualTo: isCompleted).get();
      for (var element in jsonTodos.docs) {
        todos.add(Mapper.jsonToTodoEntity(element.data()));
      }
      return todos;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print("Firebase get error: ${e.code} ${e.message}");
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
