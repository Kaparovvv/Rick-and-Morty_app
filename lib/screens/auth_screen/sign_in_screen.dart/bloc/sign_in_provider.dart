import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/commons/auth_token.dart';
import 'package:rick_and_morty_app/helpers/api_requester.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';

class SignInProvider {
  Future signInUser({
    required String userName,
    required String password,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toPost('/auth/token/login/', body: {
        "password": password,
        "username": userName,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.data.toString());
        var box = Hive.box('tokenBox');
        box.put('token', 'Token ${response.data['auth_token']}');
        print(box.get('token'));
      //  AuthToken.token = response.data['auth_token'];
       print('kjdscxn ===== ${AuthToken.token}');
      } else {
        print('!');
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print(e);
      throw CatchException.convertException(e);
    }
  }
}
