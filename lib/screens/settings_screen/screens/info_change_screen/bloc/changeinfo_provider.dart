import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/helpers/api_requester.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
class ChangeInfoProvider {
  Future patchUser({
    required String firstName,
    required String lastName,
    required String patronymic,
  }) async {
    try {
      ApiRequester requester = ApiRequester();
      var box = Hive.box('userNameBox');
      Response response = await requester.toPatch('/auth/change_user/${box.get('username')}/', body: {
        "first_name": firstName,
        "last_name": lastName,
        "patronymic": patronymic,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        log(response.data.toString());
      } else {      print("!");
        throw CatchException.convertException(response);
      }
    } catch (e) {      print(e);
      throw CatchException.convertException(e);
    }
  }

}