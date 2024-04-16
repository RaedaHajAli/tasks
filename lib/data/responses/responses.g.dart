// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'image': instance.image,
      'token': instance.token,
    };

TodoResponse _$TodoResponseFromJson(Map<String, dynamic> json) => TodoResponse(
      id: json['id'] as int?,
      todo: json['todo'] as String?,
      completed: json['completed'] as bool?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$TodoResponseToJson(TodoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todo': instance.todo,
      'completed': instance.completed,
      'userId': instance.userId,
    };

AllTodosResponse _$AllTodosResponseFromJson(Map<String, dynamic> json) =>
    AllTodosResponse(
      todos: (json['todos'] as List<dynamic>)
          .map((e) => TodoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllTodosResponseToJson(AllTodosResponse instance) =>
    <String, dynamic>{
      'todos': instance.todos,
    };

DeleteResponse _$DeleteResponseFromJson(Map<String, dynamic> json) =>
    DeleteResponse(
      isDeleted: json['isDeleted'] as bool,
    );

Map<String, dynamic> _$DeleteResponseToJson(DeleteResponse instance) =>
    <String, dynamic>{
      'isDeleted': instance.isDeleted,
    };
