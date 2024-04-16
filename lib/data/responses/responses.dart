// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'username')
  String username;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'firstName')
  String firstName;
  @JsonKey(name: 'lastName')
  String lastName;
  @JsonKey(name: 'gender')
  String gender;
  @JsonKey(name: 'image')
  String image;
  @JsonKey(name: 'token')
  String token;

  UserResponse({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
  });
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class TodoResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'todo')
  String? todo;
  @JsonKey(name: 'completed')
  bool? completed;
  @JsonKey(name: 'userId')
  int? userId;

  TodoResponse({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });
  factory TodoResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TodoResponseToJson(this);
}

@JsonSerializable()
class AllTodosResponse {
  @JsonKey(name: 'todos')
  List<TodoResponse> todos;
  AllTodosResponse({
    required this.todos,
  });
  factory AllTodosResponse.fromJson(Map<String, dynamic> json) =>
      _$AllTodosResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AllTodosResponseToJson(this);
}

@JsonSerializable()
class DeleteResponse {
  @JsonKey(name: 'isDeleted')
  bool isDeleted;
  DeleteResponse({
    required this.isDeleted,
  });
  factory DeleteResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteResponseToJson(this);
}
