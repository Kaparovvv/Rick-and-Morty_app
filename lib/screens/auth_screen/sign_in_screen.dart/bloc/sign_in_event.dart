part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}
class LoginSignInEvent extends SignInEvent {
  final String userName;
  final String password;

  LoginSignInEvent({
    required this.userName,
    required this.password,
  });
}