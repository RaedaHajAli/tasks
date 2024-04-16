import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/todos/cubit/todo_cubit.dart';
import '../presentation/resources/route_manager.dart';
import 'di.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); //named constructor
  static final instance = MyApp._internal();
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
         instance(),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.splashRoute,
      ),
    );
  }
}
