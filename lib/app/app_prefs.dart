// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/models/models.dart';
import 'constants.dart';

const String PREFS_KEY_IS_USER_LOGGED_IN = 'PREFS_KEY_IS_USER_LOGGED_IN';
const String PREFS_KEY_USER_DATA = 'PREFS_KEY_USER_DATA ';
const String PREFS_KEY_TODOS_DATA = 'PREFS_KEY_TODOS_DATA ';
const String PREFS_KEY_CACHE_TIME = 'PREFS_KEY_CACHE_TIME ';

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(
    this._sharedPreferences,
  );

  Future<void> setUserLoggedIn() async {
    await _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
    _sharedPreferences.remove(PREFS_KEY_USER_DATA);
  }

  Future<void> setUserData(User user) async {
    await _sharedPreferences.setString(PREFS_KEY_USER_DATA, jsonEncode(user));
  }

  User? getUserData() {
    String profileOffline =
        _sharedPreferences.getString(PREFS_KEY_USER_DATA) ?? Constants.empty;
    if (profileOffline.isNotEmpty) {
      User userProfile = User.fromJson(jsonDecode(profileOffline));
      return userProfile;
    } else {
      return null;
    }
  }

  setTodos(AllTodos todos) async {
    await _sharedPreferences.setString(PREFS_KEY_TODOS_DATA, jsonEncode(todos));
  }

  AllTodos? getTodos() {
    String todosOffline =
        _sharedPreferences.getString(PREFS_KEY_TODOS_DATA) ?? Constants.empty;
    if (todosOffline.isNotEmpty) {
      AllTodos todos = AllTodos.fromJson(jsonDecode(todosOffline));
      return todos;
    } else {
      return null;
    }
  }

  removeTodosFromCache() {
    _sharedPreferences.remove(PREFS_KEY_TODOS_DATA);
  }

  
}
