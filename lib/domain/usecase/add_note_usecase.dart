// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:dartz/dartz.dart';

import 'package:tasks/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../models/models.dart';
import '../repository/repository.dart';

class AddTodoUseCase
    implements BaseUseCase<AddTodoUseCaseInput, Todo> {
  final Repository _repository;
  AddTodoUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, Todo>> execute(
      AddTodoUseCaseInput input) async {
    return await _repository.add(AddTodoRequest(
        todo: input.todo, completed: false,
        userId: input.userId,));
  }
}

class AddTodoUseCaseInput {
  String todo;
  bool completed;
 
  int userId;
  AddTodoUseCaseInput({
    required this.todo,
    required this.completed,
    required this.userId,
  });
}
