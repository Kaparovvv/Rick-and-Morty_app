import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_up_screen/bloc/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthSignUpEvent>(
      (event, emit) async {
        emit(AuthLoadingState());
        try {
          await AuthRepository().createUser(
            firstName: event.firstName,
            lastName: event.lastName,
            patronymic: event.patronymic,
            userName: event.userName,
            password: event.password,
          );

          emit(AuthLoadedState());
        } catch (e) {
          
          emit(AuthErrorState(message: CatchException.convertException(e)));
        }
      },
    );
  }
}
