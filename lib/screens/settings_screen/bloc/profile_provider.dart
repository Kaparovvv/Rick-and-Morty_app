import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/helpers/api_requester.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
import 'package:rick_and_morty_app/models/profile_model.dart';

class ProfileProvider {
  Future<ProfileModel> getProfile() async {
    try {
      ApiRequester requester = ApiRequester();
      var box = Hive.box("userNameBox");
      Response response = await requester.toGet(
        '/auth/change_user/${box.get('userName')}/',
      );
      if (response.statusCode == 200) {
        print(response.data);
        ProfileModel profileModel = ProfileModel.fromJson(response.data);

        return profileModel;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print("231 $e");
      throw CatchException.convertException(e);
    }
  }
}
