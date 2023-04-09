import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

import '../../domain/entities/todo_entity.dart';

class DataUnit {
  late final collection = FirebaseFirestore.instance.collection('todos');

  Future<void> addTodo(TodoEntity todo) async {
    try {
      await FirebaseFirestore.instance.collection('todos').add({
        'name': todo.name,
        'isCompleted': todo.isCompleted,
        'finishTime': todo.finishTime,
      });
    } on FirebaseException catch(e) {
      if (kDebugMode) {
        print("Firebase add error: ${e.code} ${e.message}");
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }
}
