import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/screens/characters_screen/bloc/character_repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on<CharactersEvent>((event, emit) async {
      if (event is GetCharacterEvent) {
        emit(CharacterLoadingState());
        try {
          List<CharacterModel> characterModel =
              await CharacterRepository().getCharacter();

          emit(CharacterLoadedState(characterModel: characterModel));
        } catch (e) {
          print('Character bloc error ===== $e');

          emit(CharacterErorState(CatchException.convertException(e)));
        }
      }
    });
  }
}
