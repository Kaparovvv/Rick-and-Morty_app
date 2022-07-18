import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/models/location_model.dart';
import 'package:rick_and_morty_app/screens/characters_screen/bloc/character_repository.dart';
import 'package:rick_and_morty_app/screens/location_screen/bloc/location_repository.dart';
part 'locations_event.dart';
part 'locations_state.dart';

class LocationsBloc extends Bloc<LocationsEvent, LocationsState> {
  LocationsBloc() : super(LocationsInitial()) {
    on<LocationsEvent>((event, emit) async {
      if (event is GetLocationEvent) {
        emit(LocationLoadingState());
        try {
          List<LocationModel> locationModel =
              await LocationRepository().getLocation();
          List<CharacterModel> characterModel =
              await CharacterRepository().getCharacter();

          emit(LocationLoadedState(
            locationModel: locationModel,
            characterModel: characterModel,
          ));
        } catch (e) {
          print('Location bloc error ====== $e');
          emit(LocationErrorState(CatchException.convertException(e)));
        }
      }
    });
  }
}
