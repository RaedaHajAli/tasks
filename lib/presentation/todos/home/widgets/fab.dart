//Fab

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/freezed_data_classes.dart';
import '../../../common/widgets/widgets.dart';
import '../../../resources/color_manager.dart';

import '../../../resources/strings_manager.dart';
import '../../cubit/todo_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubit/todo_states.dart';

class Fab extends StatefulWidget {
  const Fab({super.key});

  @override
  State<Fab> createState() => _FabState();
}

class _FabState extends State<Fab> {
  late TodoCubit cubit;

  final TextEditingController _todoController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.always;

  @override
  void initState() {
    cubit = BlocProvider.of(context);
    super.initState();
  }

  @override
  void dispose() {
    _todoController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.pink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: () {
        buildModalBottomSheet(context);
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }

// Bottom Sheet
  Future<dynamic> buildModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        builder: (context) {
          return BlocBuilder<TodoCubit, TodoStates>(
            builder: (context, state) {
              return Container(
                height: 500,
                child: ModalProgressHUD(
                  inAsyncCall: cubit.inAsyncCallHome,
                  child: Form(
                    key: formKey,
                    autovalidateMode: autovalidateMode,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40,
                        right: 10,
                        left: 10,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TodoTextFormField(
                              titleController: _todoController,
                              hint: AppStrings.addYourTodo,
                              maxLines: 5,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                                title: AppStrings.add,
                                textColor: AppColor.white,
                                backgroundColor: AppColor.pink,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit
                                        .add(AddTodoObject(
                                      _todoController.text,
                                    ))
                                        .then((value) {
                                      _todoController.text = '';
                                      Navigator.pop(context);
                                    });
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
