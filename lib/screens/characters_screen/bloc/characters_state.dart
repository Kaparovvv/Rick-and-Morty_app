part of 'characters_bloc.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharacterLoadingState extends CharactersState {}

class CharacterLoadedState extends CharactersState {
  final List<CharacterModel> characterModel;

  CharacterLoadedState({required this.characterModel});
}

class CharacterErorState extends CharactersState {
  final CatchException message;

  CharacterErorState(this.message);
}
