import 'package:rick_and_morty_app/screens/settings_screen/screens/info_change_screen/bloc/changeinfo_provider.dart';

class ChangeInfoRepository {
  patchUser({
    required String firstName,
    required String lastName,
    required String patronymic,
  }) {
    ChangeInfoProvider provider = ChangeInfoProvider();
    provider.patchUser(
      firstName: firstName,
      lastName: lastName,
      patronymic: patronymic,
    );
    return "";
  }
}
