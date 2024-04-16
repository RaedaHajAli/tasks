import 'package:dio/dio.dart';



import 'package:retrofit/retrofit.dart';

import '../../app/constants.dart';
import '../responses/responses.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  //auth

  @POST('auth/login')
  Future<UserResponse> login(
      @Field('username') String username, @Field('password') String password);

  //notes

  @POST('todos/add')
 
  Future<TodoResponse> add(
  @Field('todo') String todo,
   @Field('completed') bool completed,
   @Field('userId') int userId,
  );

//Delete
  @DELETE('todos/1')
  
  Future<DeleteResponse> delete() ;
     

  //Edit
  @PUT('todos/1')
 
  Future<TodoResponse> edit(
      @Field('completed') bool completed,
  );

  @GET('todos?')
  Future<AllTodosResponse> view(
    @Query('limit') int limit ,
    @Query('skip') int skip ,
  );
}
