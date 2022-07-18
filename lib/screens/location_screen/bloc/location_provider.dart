import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/helpers/api_requester.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
import 'package:rick_and_morty_app/models/location_model.dart';

class LocationProvider {
  Future<List<LocationModel>> getLocation() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet(
        '/location/',
      );
      if (response.statusCode == 200) {
        print(response.data);
        List<LocationModel> locationModelList = response.data
            .map<LocationModel>((el) => LocationModel.fromJson(el))
            .toList();
            
        return locationModelList;
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print("231 $e");
      throw CatchException.convertException(e);
    }
  }
}