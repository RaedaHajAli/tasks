// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../app/constants.dart';
import 'dart:convert';
 String basicAuth =
      'Basic ' + base64Encode(utf8.encode('noteapp:@@Raeda@@123456@@'));

const String APPLICATION_JSON = 'application/json';
const String CONTENT_TYPE = 'content-type';
const String ACCEPT = 'accept';
const String AUTHORIZATION = 'authorization';
const String CONNECTION = 'Connection';
const String KEEP_ALIVE = 'keep-alive';


class DioFactory {
  DioFactory();
  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      'expiresInMins':'30',
      // ACCEPT: '*/*',
      // CONNECTION: KEEP_ALIVE,
      // AUTHORIZATION: basicAuth
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
    );
    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}
