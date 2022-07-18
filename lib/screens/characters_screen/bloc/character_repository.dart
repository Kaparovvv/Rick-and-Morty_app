import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/screens/characters_screen/bloc/character_provider.dart';

class CharacterRepository{
  Future<List<CharacterModel>> getCharacter(){
    CharacterProvider provider = CharacterProvider();
    
    return provider.getCharacter();
  }
}