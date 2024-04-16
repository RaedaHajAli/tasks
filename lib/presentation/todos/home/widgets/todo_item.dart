// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/models/models.dart';
import '../../cubit/todo_cubit.dart';
import '../../cubit/todo_states.dart';
import '../../../resources/strings_manager.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.backgroundColor,
    required this.todo,
    required this.onDismissed,
    required this.onPressedIcon,
  }) : super(key: key);

  final Color backgroundColor;
  final Todo todo;

  final void Function(DismissDirection)? onDismissed;
  final void Function()? onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoStates>(
      builder: (context, state) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: onDismissed,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            todo.todo,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Row(
                          children: [
                            Text(todo.completed
                                ? AppStrings.completed
                                : AppStrings.todo),
                            IconButton(
                                onPressed: onPressedIcon,
                                icon: Icon(
                                  Icons.check_circle_sharp,
                                  color: todo.completed
                                      ? Colors.green
                                      : Colors.grey,
                                )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
