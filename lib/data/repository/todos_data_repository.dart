import 'dart:async';

import 'package:week2_firebase/data/data_unit/data_unit.dart';
import 'package:week2_firebase/domain/entities/todo_entity.dart';
import 'package:week2_firebase/domain/repository/todos_repository.dart';

class TodosDataRepository extends TodosRepository {
  final _dataUnit = DataUnit();

  @override
  Future<void> addTodo(TodoEntity todo) {
    return _dataUnit.addTodo(todo);
  }

  @override
  Future<List<TodoEntity>> getCompleted(bool isCompleted) async {
    return _dataUnit.getCompleted(isCompleted);
  }

  @override
  Future<void> updateCompleted(TodoEntity todo) {
    return _dataUnit.updateCompleted(todo.copyWith(isCompleted: !todo.isCompleted));
  }
}
