import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



import '../../app/di.dart';
import '../../domain/usecase/login_usecase.dart';

import '../auth/login/cubit/login_cubit.dart';
import '../auth/login/view/login_view.dart';

import '../todos/home/home_view.dart';


import '../../presentation/resources/strings_manager.dart';

import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  
  static const String homeRoute = '/home';
 
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LoginCubit>(
                  create: (context) => LoginCubit(instance<LoginUseCase>()),
                  child: const LoginView(),
                ));
    
      case Routes.homeRoute:
        initHomeModule();

        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
  
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
