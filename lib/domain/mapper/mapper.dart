import '../../app/extensions.dart';

import '../../app/constants.dart';
import '../../data/responses/responses.dart';
import '../models/models.dart';

extension UserResponseExtension on UserResponse? {
  User toDomain() {
    return User(
      id: this?.id.orZero() ?? Constants.zero,
      username: this?.username.orEmpty() ?? Constants.empty,
      email: this?.email.orEmpty() ?? Constants.empty,
      firstName: this?.firstName.orEmpty() ?? Constants.empty,
      lastName: this?.email.orEmpty() ?? Constants.empty,
      gender: this?.email.orEmpty() ?? Constants.empty,
      image: this?.email.orEmpty() ?? Constants.empty,
      token: this?.email.orEmpty() ?? Constants.empty,
    );
  }
}

extension TodoResponseExtension on TodoResponse? {
  Todo toDomain() {
    return Todo(
      id: this?.id ?? Constants.zero,
      todo: this?.todo.orEmpty() ?? Constants.empty,
      completed:this?.completed?? false,
      userId: this?.userId ?? Constants.zero,
    );
  }
}

extension AllTodosResponseExtension on AllTodosResponse? {
 AllTodos toDomain() {
    List<Todo> todos =
        (this?.todos?.map((todoResponse) => todoResponse.toDomain()) ??
                const Iterable.empty())
            .cast<Todo>()
            .toList();

    return AllTodos(todos: todos);
  }
}
extension DeleteResponseExtension on DeleteResponse? {
  DeletedTodo toDomain() {
    return DeletedTodo(
     
     isDeleted:this?.isDeleted?? false,
    
    );
  }
}
