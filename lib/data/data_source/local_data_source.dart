import 'package:tasks/app/app_prefs.dart';
import 'package:tasks/app/di.dart';
import 'package:tasks/domain/models/models.dart';





abstract class LocalDataSource {
  Future<AllTodos?> getTodos();
  saveTodos(AllTodos todos);
  void clearCache();
}

class LocalDataSourceImpl implements LocalDataSource {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  @override
  void clearCache() {
    _appPreferences.removeTodosFromCache();
   
  }

  @override
  Future<AllTodos?> getTodos() async {
    return _appPreferences.getTodos();
  
  }

  @override
  saveTodos(AllTodos todos) {
   
    _appPreferences.setTodos(todos);
  }


}


