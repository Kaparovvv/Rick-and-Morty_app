part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthSignUpEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String password;
  final String patronymic;
  final String userName;

  AuthSignUpEvent({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.patronymic,
    required this.userName,
  });
}


