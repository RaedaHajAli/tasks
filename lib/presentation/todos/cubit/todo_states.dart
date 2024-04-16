// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class TodoStates {}

class InitialTodoState extends TodoStates {}

class LoadingGetTodoState extends TodoStates {}

class SuccessGetTodoState extends TodoStates {}

class FailureGetTodoState extends TodoStates {
  String message;
  FailureGetTodoState({
    required this.message,
  });
}

class LoadingAddTodoState extends TodoStates {}

class SuccessAddTodoState extends TodoStates {}

class FailureAddTodoState extends TodoStates {
  String message;
  FailureAddTodoState({
    required this.message,
  });
}

class LoadingDeleteTodoState extends TodoStates {}

class SuccessDeleteTodoState extends TodoStates {}

class FailureDeleteTodoState extends TodoStates {}

class LoadingEditTodoState extends TodoStates {}

class SuccessEditeTodoState extends TodoStates {}

class FailureEditTodoState extends TodoStates {}

class ChangeFirstLoadingTodoState extends TodoStates {}
class ChangeIsLoadingMoreTodoState extends TodoStates {}