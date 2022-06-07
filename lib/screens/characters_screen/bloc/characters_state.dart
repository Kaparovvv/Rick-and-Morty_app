part of 'characters_bloc.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharacterLoadingState extends CharactersState {}

class CharacterLoadedState extends CharactersState {
  final List<CharacterModel> characterModelList;

  CharacterLoadedState({required this.characterModelList});
}

class CharacterErorState extends CharactersState {
  final String message;

  CharacterErorState(this.message);
}
