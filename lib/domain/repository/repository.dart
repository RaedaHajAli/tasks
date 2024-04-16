import 'package:dartz/dartz.dart';


import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../models/models.dart';

abstract class Repository {
  //auth
 
  Future<Either<Failure, User>> login(LoginRequest loginRequest);

  //notes
  Future<Either<Failure, Todo>> add(AddTodoRequest addTodoRequest);

  Future<Either<Failure, Todo>> edit(
      EditTodoRequest editTodoRequest);
  Future<Either<Failure, DeletedTodo>> delete(
    );
  Future<Either<Failure, AllTodos>> view( ViewTodoRequest viewTodoRequest);
}
