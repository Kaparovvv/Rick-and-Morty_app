import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_in_screen.dart/bloc/sign_in_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<LoginSignInEvent>((event, emit) async {
      emit(SignInLoadingState());
      try {
        await SignInRepository().signInUser(
          userName: event.userName,
          password: event.password,
        );

        emit(SignInLoadedState());
      } catch (e) {
        emit(SignInErrorState(message: CatchException.convertException(e)));
      }
    });
  }
}
