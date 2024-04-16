// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:tasks/data/network/requests.dart';

import '../../data/network/failure.dart';

import '../models/models.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class ViewTodoUseCase implements BaseUseCase<ViewTodoUseCaseInput, AllTodos> {
  final Repository _repository;
  ViewTodoUseCase(
    this._repository,
  );
  @override
  Future<Either<Failure, AllTodos>> execute(ViewTodoUseCaseInput input) async {
    return await _repository.view(ViewTodoRequest(limit:input. limit, skip: input.skip));
  }
}

class ViewTodoUseCaseInput{
  int limit;
  int skip;
  ViewTodoUseCaseInput({
    required this.limit,
    required this.skip,
  });
}


