import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';

class SecondApiRequester {
  static String url = 'https://rickandmortyapi.com/api';
  Future<Dio> initDio() async {
    return Dio(
      BaseOptions(
        baseUrl: url,
        responseType: ResponseType.json,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );
  }

  Future<Response> toGet(String url, {Map<String, dynamic>? param}) async {
    Dio dio = await initDio();
    try {
      return dio.get(url, queryParameters: param);
    } catch (e) {
      throw CatchException.convertException(e);
    }
  }
}