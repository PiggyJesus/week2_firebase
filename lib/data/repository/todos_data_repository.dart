import 'dart:async';

import 'package:week2_firebase/data/data_unit/data_unit.dart';
import 'package:week2_firebase/domain/entities/todo_entity.dart';
import 'package:week2_firebase/domain/repository/todos_repository.dart';

class TodosDataRepository extends TodosRepository {
  final _dataUnit = DataUnit();

  @override
  Future<void> addTodo(TodoEntity todo) {
    //return appDb.addTodoFromEntity(todo);
    return _dataUnit.addTodo(todo);
  }

  @override
  Future<List<TodoEntity>> getCompleted(bool isCompleted) async {
    //return (await appDb.getCompleted(isCompleted))
    //.map((e) => Mapper.todoToTodoEntity(e))
    //    .toList();
    return _dataUnit.getCompleted(isCompleted);
  }

  @override
  Future<void> updateCompleted(int id, bool isCompleted) {
   // return appDb.updateCompleted(id, isCompleted);
    return Future(1 as FutureOr<int> Function());
  }

}