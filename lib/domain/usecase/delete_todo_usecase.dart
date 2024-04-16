// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:tasks/domain/models/models.dart';



import '../../data/network/failure.dart';

import '../repository/repository.dart';
import 'base_usecase.dart';

class DeleteTodoUseCase
    implements BaseUseCase<void, DeletedTodo> {
  final Repository _repository;
  DeleteTodoUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure,DeletedTodo>> execute(
      void input) async {
    return await _repository.delete();
  }
}


