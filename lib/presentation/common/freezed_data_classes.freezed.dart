// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginObject {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginObjectImplCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$LoginObjectImplCopyWith(
          _$LoginObjectImpl value, $Res Function(_$LoginObjectImpl) then) =
      __$$LoginObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$LoginObjectImplCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$LoginObjectImpl>
    implements _$$LoginObjectImplCopyWith<$Res> {
  __$$LoginObjectImplCopyWithImpl(
      _$LoginObjectImpl _value, $Res Function(_$LoginObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$LoginObjectImpl(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginObjectImpl implements _LoginObject {
  _$LoginObjectImpl(this.username, this.password);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginObjectImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      __$$LoginObjectImplCopyWithImpl<_$LoginObjectImpl>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String username, final String password) =
      _$LoginObjectImpl;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddTodoObject {
  String get todo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddTodoObjectCopyWith<AddTodoObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoObjectCopyWith<$Res> {
  factory $AddTodoObjectCopyWith(
          AddTodoObject value, $Res Function(AddTodoObject) then) =
      _$AddTodoObjectCopyWithImpl<$Res, AddTodoObject>;
  @useResult
  $Res call({String todo});
}

/// @nodoc
class _$AddTodoObjectCopyWithImpl<$Res, $Val extends AddTodoObject>
    implements $AddTodoObjectCopyWith<$Res> {
  _$AddTodoObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
  }) {
    return _then(_value.copyWith(
      todo: null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddTodoObjectImplCopyWith<$Res>
    implements $AddTodoObjectCopyWith<$Res> {
  factory _$$AddTodoObjectImplCopyWith(
          _$AddTodoObjectImpl value, $Res Function(_$AddTodoObjectImpl) then) =
      __$$AddTodoObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String todo});
}

/// @nodoc
class __$$AddTodoObjectImplCopyWithImpl<$Res>
    extends _$AddTodoObjectCopyWithImpl<$Res, _$AddTodoObjectImpl>
    implements _$$AddTodoObjectImplCopyWith<$Res> {
  __$$AddTodoObjectImplCopyWithImpl(
      _$AddTodoObjectImpl _value, $Res Function(_$AddTodoObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
  }) {
    return _then(_$AddTodoObjectImpl(
      null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddTodoObjectImpl implements _AddTodoObject {
  _$AddTodoObjectImpl(this.todo);

  @override
  final String todo;

  @override
  String toString() {
    return 'AddTodoObject(todo: $todo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTodoObjectImpl &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTodoObjectImplCopyWith<_$AddTodoObjectImpl> get copyWith =>
      __$$AddTodoObjectImplCopyWithImpl<_$AddTodoObjectImpl>(this, _$identity);
}

abstract class _AddTodoObject implements AddTodoObject {
  factory _AddTodoObject(final String todo) = _$AddTodoObjectImpl;

  @override
  String get todo;
  @override
  @JsonKey(ignore: true)
  _$$AddTodoObjectImplCopyWith<_$AddTodoObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditTodoObject {
  bool get completed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditTodoObjectCopyWith<EditTodoObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTodoObjectCopyWith<$Res> {
  factory $EditTodoObjectCopyWith(
          EditTodoObject value, $Res Function(EditTodoObject) then) =
      _$EditTodoObjectCopyWithImpl<$Res, EditTodoObject>;
  @useResult
  $Res call({bool completed});
}

/// @nodoc
class _$EditTodoObjectCopyWithImpl<$Res, $Val extends EditTodoObject>
    implements $EditTodoObjectCopyWith<$Res> {
  _$EditTodoObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditTodoObjectImplCopyWith<$Res>
    implements $EditTodoObjectCopyWith<$Res> {
  factory _$$EditTodoObjectImplCopyWith(_$EditTodoObjectImpl value,
          $Res Function(_$EditTodoObjectImpl) then) =
      __$$EditTodoObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool completed});
}

/// @nodoc
class __$$EditTodoObjectImplCopyWithImpl<$Res>
    extends _$EditTodoObjectCopyWithImpl<$Res, _$EditTodoObjectImpl>
    implements _$$EditTodoObjectImplCopyWith<$Res> {
  __$$EditTodoObjectImplCopyWithImpl(
      _$EditTodoObjectImpl _value, $Res Function(_$EditTodoObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completed = null,
  }) {
    return _then(_$EditTodoObjectImpl(
      null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditTodoObjectImpl implements _EditTodoObject {
  _$EditTodoObjectImpl(this.completed);

  @override
  final bool completed;

  @override
  String toString() {
    return 'EditTodoObject(completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditTodoObjectImpl &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditTodoObjectImplCopyWith<_$EditTodoObjectImpl> get copyWith =>
      __$$EditTodoObjectImplCopyWithImpl<_$EditTodoObjectImpl>(
          this, _$identity);
}

abstract class _EditTodoObject implements EditTodoObject {
  factory _EditTodoObject(final bool completed) = _$EditTodoObjectImpl;

  @override
  bool get completed;
  @override
  @JsonKey(ignore: true)
  _$$EditTodoObjectImplCopyWith<_$EditTodoObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
