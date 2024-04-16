// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:tasks/data/data_source/local_data_source.dart';

import 'package:tasks/domain/mapper/mapper.dart';

import '../../domain/models/models.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../network/requests.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  final NetworkInfo _networkInfo;
  RepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, User>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // there is internet connection

      try {
        final response = await _remoteDataSource.login(loginRequest);

        //success
        //return either right

        return Right(response.toDomain());
      } catch (e) {
        //dio exception
        //return either left by using error handler

        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      // internet connection error
      // return  either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Todo>> add(AddTodoRequest addTodoRequest) async {
    if (await _networkInfo.isConnected) {
      // there is internet connection
     
      try {
        final response = await _remoteDataSource.add(addTodoRequest);

        //success
        //return either right
        _localDataSource.clearCache();
       
        return Right(response.toDomain());
       
      } catch (e) {
        //dio exception
        //return either left by using error handler

        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      // internet connection error
      // return  either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, DeletedTodo>> delete() async {
    if (await _networkInfo.isConnected) {
      // there is internet connection
      _localDataSource.clearCache();
      print('cache cleared');
      try {
        final response = await _remoteDataSource.delete();

        //success
        //return either right

        return Right(response.toDomain());
      } catch (e) {
        //dio exception
        //return either left by using error handler

        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      // internet connection error
      // return  either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Todo>> edit(EditTodoRequest editTodoRequest) async {
    if (await _networkInfo.isConnected) {
      // there is internet connection
      _localDataSource.clearCache();
       print('cache cleared');
      try {
        final response = await _remoteDataSource.edit(editTodoRequest);

        //success
        //return either right

        return Right(response.toDomain());
      } catch (e) {
        //dio exception
        //return either left by using error handler

        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      // internet connection error
      // return  either left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AllTodos>> view( ViewTodoRequest viewTodoRequest) async {
    
     if (await _networkInfo.isConnected) {
        // there is internet connection

        try {
          final response = await _remoteDataSource.view(viewTodoRequest);

          //success
          //return either right
          AllTodos todos = response.toDomain();
          
          return Right(todos);
        } catch (e) {
          //dio exception
          //return either left by using error handler

          return Left(ErrorHandler.handle(e).failure);
        }
      } else {
        // internet connection error
        // return  either left
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
  }
}
