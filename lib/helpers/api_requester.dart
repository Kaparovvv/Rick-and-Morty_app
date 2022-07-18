import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';

class ApiRequester {
  var box = Hive.box('tokenBox');
  static String url = 'https://rick-morty-flutter.herokuapp.com/api/v1';
  Future<Dio> initDio() async {
    String token = await box.get('token', defaultValue: '');
    print(token);
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        receiveTimeout: 30000,
        headers: {
          "Authorization": token
          // AuthToken.token == null ? "" : "Token ${AuthToken.token}"
        },
        connectTimeout: 30000,
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: {}
          // data: jsonEncode(params),
          );
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPost(String url,
      {Map<String, dynamic>? param, required Map<String, dynamic> body}) async {
    Dio dio = await initDio();
    try {
      return dio.post(url, queryParameters: param, data: body
          // data: jsonEncode(params),
          );
    } catch (e) {
      log(e.toString());
      throw CatchException.convertException(e);
    }
  }

  Future<Response> toPatch(String url,
      {Map<String, dynamic>? param, required Map<String, dynamic> body}) async {
    Dio dio = await initDio();
    try {
      return dio.patch(url, queryParameters: param, data: body);
    } catch (e) {
      log(e.toString());
      throw CatchException.convertException(e);
    }
  }
}
