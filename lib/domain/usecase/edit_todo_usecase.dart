// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:dartz/dartz.dart';

import 'package:tasks/domain/usecase/base_usecase.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../models/models.dart';
import '../repository/repository.dart';

class EditTodoUseCase implements BaseUseCase<EditTodoUseCaseInput, Todo> {
  final Repository _repository;
  EditTodoUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, Todo>> execute(EditTodoUseCaseInput input) async {
    return await _repository.edit(EditTodoRequest(
    completed: input.completed,));
  }
}

class EditTodoUseCaseInput {
  bool completed;
  EditTodoUseCaseInput({
    required this.completed,
  });
}
