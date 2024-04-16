// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class User {
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

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

class OperationStatus {
  int status;

  String message;
  OperationStatus({
    required this.status,
    required this.message,
  });
}

@JsonSerializable()
class Todo {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'todo')
  String todo;
  @JsonKey(name: 'completed')
  bool completed;
  @JsonKey(name: 'userId')
  int userId;
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}

@JsonSerializable()
class AllTodos {
  List<Todo> todos;
  AllTodos({
    required this.todos,
  });
  factory AllTodos.fromJson(Map<String, dynamic> json) => _$AllTodosFromJson(json);
  Map<String, dynamic> toJson() => _$AllTodosToJson(this);
}

@JsonSerializable()
class DeletedTodo  {
    @JsonKey(name: 'isDeleted')
  bool isDeleted;
  DeletedTodo({
    required this.isDeleted,
  });
 factory DeletedTodo.fromJson(Map<String, dynamic> json) => _$DeletedTodoFromJson(json);
  Map<String, dynamic> toJson() => _$DeletedTodoToJson(this);

}
