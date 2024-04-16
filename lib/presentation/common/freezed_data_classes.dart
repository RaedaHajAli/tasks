
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String username, String password) = _LoginObject;
}

@freezed
class AddTodoObject with _$AddTodoObject {
  factory AddTodoObject(
    String todo,
  ) = _AddTodoObject;
}

@freezed
class EditTodoObject with _$EditTodoObject {
  factory EditTodoObject(bool completed
    ) = _EditTodoObject;
}
