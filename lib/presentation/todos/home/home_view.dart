import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/models/models.dart';

import '../../common/freezed_data_classes.dart';
import '../../resources/color_manager.dart';
import '../../resources/route_manager.dart';

import '../cubit/todo_cubit.dart';
import '../cubit/todo_states.dart';
import 'widgets/empty_home.dart';
import 'widgets/fab.dart';
import 'widgets/todo_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late TodoCubit cubit;
  List<Todo> todos = [];

  @override
  void initState() {
    cubit = BlocProvider.of(context);
    cubit.firstLoad();
    // cubit.getTodos();
   cubit. controller=ScrollController().. addListener(cubit.loadMore);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.deepPurple,
      appBar: buildHomeAppBar(context),
      body: _getContentWidget(),
      floatingActionButton: const Fab(),
    );
  }

  //App bar
  AppBar buildHomeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.deepPurple,
      title: const Text('Todos'),
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              cubit.logout();
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            },
            icon: const Icon(Icons.power_settings_new_outlined))
      ],
    );
  }

//Home
  Widget _getContentWidget() {
    return BlocBuilder<TodoCubit, TodoStates>(builder: (context, state) {
      todos = cubit.todos;
      if (todos.isEmpty) {
        return const EmptyHome();
      } else {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: cubit.controller,
           
            
                itemBuilder: (context, index) {
                  Color backgroundColor =
                      AppColor.notesColor[index % AppColor.notesColor.length];
                  return buildNoteItem(backgroundColor, todos[index], context);
                },
                itemCount: cubit.todos.length,
              ),
            ),
                  if (cubit. isLoadMoreRunning == true)
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 40),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),

            if (cubit.hasNextPage == false)
              Container(
                padding: const EdgeInsets.only(top: 30, bottom: 40),
                color: Colors.green,
                child: const Center(
                  child: Text('You have fetched all of the content'),
                ),)
          ],
        );
      }
    });
  }

  TodoItem buildNoteItem(
      Color backgroundColor, Todo todo, BuildContext context) {
    return TodoItem(
      backgroundColor: backgroundColor,
      todo: todo,
      onDismissed: (direction) {
        cubit.deleteTodo(todo.id);
      },
      onPressedIcon: () {
        cubit.editTodo(EditTodoObject(!todo.completed));
      },
    );
  }
}
