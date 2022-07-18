part of 'changeinfo_bloc.dart';

@immutable
abstract class ChangeInfoEvent {}

class PatchChangeInfoEvent extends ChangeInfoEvent {
  final String firstName;
  final String lastName;
  final String patronymic;

  PatchChangeInfoEvent({
    required this.firstName,
    required this.lastName,
    required this.patronymic,
  });
}
