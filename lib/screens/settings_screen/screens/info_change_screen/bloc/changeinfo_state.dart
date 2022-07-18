part of 'changeinfo_bloc.dart';

@immutable
abstract class ChangeInfoState {}

class ChangeinfoInitial extends ChangeInfoState {}

class ChangeInfoLoadingState extends ChangeInfoState {}

class ChangeInfoLoadedState extends ChangeInfoState {}

class ChangeInfoErrorState extends ChangeInfoState {
  final CatchException message;

  ChangeInfoErrorState({required this.message});
}
