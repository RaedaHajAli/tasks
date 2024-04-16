// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:tasks/data/network/app_api.dart';
import 'package:tasks/data/network/requests.dart';
import 'package:tasks/data/responses/responses.dart';

abstract class RemoteDataSource {
  // auth

  Future<UserResponse> login(LoginRequest loginRequest);

  //notes
  Future<TodoResponse> add(AddTodoRequest addTodoRequest);

  Future<TodoResponse> edit(EditTodoRequest editTodoRequest);
  Future<DeleteResponse> delete();
  Future<AllTodosResponse> view(ViewTodoRequest viewTodoRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(
    this._appServiceClient,
  );

//auth

  @override
  Future<UserResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.username, loginRequest.password);
  }

//notes
  @override
  Future<TodoResponse> add(AddTodoRequest addTodoRequest) async {
    return await _appServiceClient.add(
      addTodoRequest.todo,
      addTodoRequest.completed,
      addTodoRequest.userId,
    );
  }

  @override
  Future<TodoResponse> edit(EditTodoRequest editTodoRequest) async {
    return await _appServiceClient.edit(
      editTodoRequest.completed
      
       );
  }

  @override
  Future<DeleteResponse> delete() async {
    return await _appServiceClient.delete();
  }

  @override
  Future<AllTodosResponse> view(ViewTodoRequest viewTodoRequest) async {
    return await _appServiceClient.view(viewTodoRequest.limit,viewTodoRequest.skip);
  }
}
