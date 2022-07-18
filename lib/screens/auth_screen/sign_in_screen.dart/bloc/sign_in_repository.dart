import 'package:rick_and_morty_app/screens/auth_screen/sign_in_screen.dart/bloc/sign_in_provider.dart';

class SignInRepository {
  signInUser({
    required String userName,
    required String password,
  }) {
    SignInProvider provider = SignInProvider();
   
    return  provider.signInUser(
      userName: userName,
      password: password,
    );
  }
}
