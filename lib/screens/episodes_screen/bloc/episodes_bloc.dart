import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
import 'package:rick_and_morty_app/models/episodes_model.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/bloc/episode_repository.dart';
part 'episodes_event.dart';
part 'episodes_state.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  EpisodesBloc() : super(EpisodesInitial()) {
    on<EpisodesEvent>((event, emit) async {
      if (event is GetEpisodesEvent) {
        emit(EpisodesLoadingState());

        try {
          List<EpisodeModel> episodeModel = await EpisodeRepository().getEpisode();

         emit(EpisodesLoadedState(episodeModelList: episodeModel));
        } catch (e) {
          print('Episodes bloc error ===== $e');

          emit(EpisodesErrorState(CatchException.convertException(e)));
        }
      }
    });
  }
}
