import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/helpers/api_requester.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
import 'package:rick_and_morty_app/models/episodes_model.dart';

class EpisodeProvider {
  Future<List<EpisodeModel>> getEpisode() async {
    try {
      ApiRequester requester = ApiRequester();
      Response response = await requester.toGet(
        '/episodes/',
      );
      if (response.statusCode == 200){
        print(response.data);
        List<EpisodeModel> episodeModelList = response.data.map<EpisodeModel>((el) => EpisodeModel.fromJson(el)).toList();

        return episodeModelList;
      }else{
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('231 $e');
      throw CatchException.convertException(e);
    }
  }
}
