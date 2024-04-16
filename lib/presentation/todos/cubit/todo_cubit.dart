// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/app_prefs.dart';
import '../../../data/data_source/local_data_source.dart';
import '../../../data/network/network_info.dart';
import '../../../domain/models/models.dart';
import '../../../domain/usecase/add_note_usecase.dart';
import '../../../domain/usecase/delete_todo_usecase.dart';
import '../../../domain/usecase/edit_todo_usecase.dart';
import '../../../domain/usecase/view_todo_usecase.dart';
import '../../common/freezed_data_classes.dart';
import 'todo_states.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit(
    this._viewTodoUseCase,
    this._deleteTodoUseCase,
    this._addTodoUseCase,
    this._editTodoUseCase,
    this._appPreferences,
    this._networkInfo,
    this._localDataSource,
  ) : super(InitialTodoState());
  final ViewTodoUseCase _viewTodoUseCase;
  final DeleteTodoUseCase _deleteTodoUseCase;
  final AddTodoUseCase _addTodoUseCase;

  final EditTodoUseCase _editTodoUseCase;
  final AppPreferences _appPreferences;
  final NetworkInfo _networkInfo;
  final LocalDataSource _localDataSource;

  int? userId;

  User? user;

  List<Todo> todos = [];

  // _getUserId() {
  //   user = _appPreferences.getUserData();
  //   if (user != null) {
  //     userId = user?.id;
  //   }
  // }
  int limit = 10;
  int skip = 0;
  bool isFirstLoadRunning = false;
  bool hasNextPage = true;

  bool isLoadMoreRunning = false;

  void firstLoad() async {
    if (await _networkInfo.isConnected) {
      isFirstLoadRunning = true;
      emit(ChangeFirstLoadingTodoState());
      try {
        getTodos();
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong');
        }
      }

      isFirstLoadRunning = false;
      emit(ChangeFirstLoadingTodoState());
    } else {
      await getFromLocalCache();
    }
  }

  Future<void> getFromLocalCache() async {
      AllTodos? all = await _localDataSource.getTodos();
   
    if (all != null) {
      todos = all.todos;
      emit(SuccessGetTodoState());
    }
  }

  late ScrollController controller;
  List<Todo> fetchTodos = [];
  void loadMore() async {
    if (await _networkInfo.isConnected) {
      if (hasNextPage == true &&
          isFirstLoadRunning == false &&
          isLoadMoreRunning == false &&
          controller.position.extentAfter < 300) {
        isLoadMoreRunning = true; // Display a progress indicator at the bottom
        emit(ChangeIsLoadingMoreTodoState());

        skip += 10;

        try {
          fetchTodos = [];
          emit(LoadingGetTodoState());

          (await _viewTodoUseCase
                  .execute(ViewTodoUseCaseInput(limit: limit, skip: skip)))
              .fold((failure) {
            emit(FailureGetTodoState(message: failure.message));
          }, (data) {
            fetchTodos = data.todos;
            if (fetchTodos.isNotEmpty) {
              todos.addAll(fetchTodos);
              _localDataSource.saveTodos(AllTodos(todos: todos));
            } else {
              hasNextPage = false;
            }

            emit(SuccessGetTodoState());
          });
        } catch (err) {
          if (kDebugMode) {
            print('Something went wrong!');
          }
        }

        isLoadMoreRunning = false;
        emit(ChangeIsLoadingMoreTodoState());
      }
    } else {
      await getFromLocalCache();
    }
  }

  getTodos() async {
    todos = [];
    skip = 0;
    emit(LoadingGetTodoState());
    // _getUserId();

    (await _viewTodoUseCase.execute(ViewTodoUseCaseInput(limit: 10, skip: 0)))
        .fold((failure) {
      emit(FailureGetTodoState(message: failure.message));
    }, (data) {
      todos = data.todos;

      emit(SuccessGetTodoState());
    });
  }

  bool inAsyncCallHome = false;
  Future<void> add(
    AddTodoObject addTodoObject,
  ) async {
    inAsyncCallHome = true;
    emit(LoadingAddTodoState());
    (await _addTodoUseCase.execute(AddTodoUseCaseInput(
            todo: addTodoObject.todo, completed: false, userId: 5)))
        .fold((failure) {
      inAsyncCallHome = false;
      emit(FailureAddTodoState(message: failure.message));
     
    }, (data) {
      inAsyncCallHome = false;
      emit(SuccessAddTodoState());

      getTodos();
    });
  }

  deleteTodo(int todoId) async {
    emit(LoadingDeleteTodoState());
    (await _deleteTodoUseCase.execute(Void)).fold((failure) {
      emit(FailureDeleteTodoState());
    }, (deletedTodo) {
      emit(SuccessDeleteTodoState());
      getTodos();
    });
  }

  Future<void> editTodo(EditTodoObject editTodoObject) async {
    emit(LoadingEditTodoState());
    (await _editTodoUseCase.execute(EditTodoUseCaseInput(completed: false

        // editTodoObject.completed => when use real api
        ))).fold((failure) {
      emit(FailureEditTodoState());
    }, (todo) {
      emit(SuccessEditeTodoState());
      getTodos();
    });
  }

  logout() {
    _appPreferences.logout();
  }
}
