// ignore_for_file: public_member_api_docs, sort_constructors_first

class LoginRequest {
  String username;
  String password;
  LoginRequest(
    this.username,
    this.password,
  );
}

//To dos
//Add Todo
class AddTodoRequest {
  String todo;
  bool completed;

  int userId;
  AddTodoRequest({
    required this.todo,
    required this.completed,
    required this.userId,
  });
}

//edit Todo
class EditTodoRequest {
  bool completed;
  EditTodoRequest({
    required this.completed,
  });
}

//view Todos
class ViewTodoRequest {
  int limit;
  int skip;
  ViewTodoRequest({
    required this.limit,
    required this.skip,
  });
}
