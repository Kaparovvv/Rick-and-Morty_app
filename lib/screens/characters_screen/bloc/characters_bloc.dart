import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/models/character_model.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on<CharactersEvent>((event, emit) {
      if (event is GetCharacterEvent) {
        emit(CharacterLoadingState());
        try {
          List<CharacterModel> characterModelList = [
            CharacterModel(
              imageUrl: 'assets/images/rick_.sanchez.png',
              name: 'Рик Санчез',
              isAlive: 'живой',
              species: 'Человек',
              gender: 'Мужской',
              description: 'Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.',
              placeOfBirth: 'Земля C-137',
              location: 'Земля (Измерение подменны)',
            ),
            CharacterModel(
              imageUrl: 'assets/images/rick_.sanchez.png',
              name: 'Рик Санчез',
              isAlive: 'живой', 
              species: 'Человек',
              gender: 'Мужской',
              description: 'Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.',
              placeOfBirth: 'Земля C-137',
              location: 'Земля (Измерение подменны)',
            ),
          ];

          emit(CharacterLoadedState(characterModelList: characterModelList));
        } catch (e) {
          print('Character bloc error ===== $e');

          emit(CharacterErorState(e.toString()));
        }
      }
    });
  }
}
