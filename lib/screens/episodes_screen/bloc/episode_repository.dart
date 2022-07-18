import 'package:rick_and_morty_app/models/episodes_model.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/bloc/episode_provider.dart';

class EpisodeRepository{
  Future<List<EpisodeModel>> getEpisode(){
    EpisodeProvider provider = EpisodeProvider();

    return provider.getEpisode();
  }
}