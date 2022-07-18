
import 'package:rick_and_morty_app/screens/auth_screen/sign_up_screen/bloc/auth_provider.dart';

class AuthRepository {
  createUser({
    required String lastName,
    required String firstName,
    required String patronymic,
    required String userName,
    required String password,
  }) {
    AuthProvider provider = AuthProvider();
    provider.createUser(
      firstName: firstName,
      lastName: lastName,
      password: password,
      patronyMic: patronymic,
      userName: userName,
    );
    return "";
  }
}