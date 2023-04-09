import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/todo_entity.dart';

abstract class Mapper {
  static TodoEntity jsonToTodoEntity(Map<String, dynamic> todo) {
    Timestamp t = todo['finishTime'];
    return TodoEntity(
      name: todo['name'],
      finishTime: t.toDate(),
      isCompleted: todo['isCompleted'],
      id: todo['id'],
    );

  }
}
