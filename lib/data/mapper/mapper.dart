import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/todo_entity.dart';

abstract class Mapper {
  static TodoEntity jsonToTodoEntity(QueryDocumentSnapshot<Map<String, dynamic>> todo) {
    Timestamp t = todo.data()['finishTime'];
    return TodoEntity(
      name: todo.data()['name'],
      finishTime: t.toDate(),
      isCompleted: todo.data()['isCompleted'],
      id: int.parse(todo.id),
    );

  }
}
