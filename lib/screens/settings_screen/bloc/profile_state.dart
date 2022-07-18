part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class EditprofileBlocInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ProfileModel profileModelList;

  ProfileLoadedState({required this.profileModelList});
}

class ProfileErrorState extends ProfileState {
  final CatchException message;

  ProfileErrorState(this.message);
}
