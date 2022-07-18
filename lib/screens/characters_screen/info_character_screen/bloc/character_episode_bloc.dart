import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'character_episode_event.dart';
part 'character_episode_state.dart';

class CharacterEpisodeBloc extends Bloc<CharacterEpisodeEvent, CharacterEpisodeState> {
  CharacterEpisodeBloc() : super(CharacterEpisodeInitial()) {
    on<CharacterEpisodeEvent>((event, emit) {
    });
  }
}
