part of 'locations_bloc.dart';

@immutable
abstract class LocationsState {}

class LocationsInitial extends LocationsState {}

class LocationLoadingState extends LocationsState {}

class LocationLoadedState extends LocationsState {
  final List<LocationModel> locationModel;
  final List<CharacterModel> characterModel;


  LocationLoadedState({
    required this.locationModel,
    required this.characterModel, 
  });
}

class LocationErrorState extends LocationsState {
  final CatchException message;

  LocationErrorState(this.message);
}
