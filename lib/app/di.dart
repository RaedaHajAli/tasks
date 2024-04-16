import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks/data/data_source/local_data_source.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';
import '../domain/usecase/add_note_usecase.dart';
import '../domain/usecase/delete_todo_usecase.dart';
import '../domain/usecase/edit_todo_usecase.dart';
import '../domain/usecase/login_usecase.dart';

import '../domain/usecase/view_todo_usecase.dart';
import 'app_prefs.dart';

final instance = GetIt.instance;
Future<void> initModule() async {
  final DioFactory dioFactory = DioFactory();
  Dio dio = await dioFactory.getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<AppServiceClient>()));
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));
  instance.registerLazySingleton<Repository>(() =>
      RepositoryImpl(instance<RemoteDataSource>(),instance<LocalDataSource>(), instance<NetworkInfo>()));

  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(sharedPrefs));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(
        () => LoginUseCase(instance<Repository>()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<ViewTodoUseCase>()) {
    instance.registerFactory<ViewTodoUseCase>(
        () => ViewTodoUseCase(instance<Repository>()));
    instance.registerFactory<AddTodoUseCase>(
        () => AddTodoUseCase(instance<Repository>()));

    instance.registerFactory<DeleteTodoUseCase>(
        () => DeleteTodoUseCase(instance<Repository>()));

    instance.registerFactory<EditTodoUseCase>(
        () => EditTodoUseCase(instance<Repository>()));
  }
}
