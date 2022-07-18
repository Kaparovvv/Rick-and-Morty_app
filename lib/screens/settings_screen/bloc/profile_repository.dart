import 'package:rick_and_morty_app/models/profile_model.dart';
import 'package:rick_and_morty_app/screens/settings_screen/bloc/profile_provider.dart';

class ProfileRepository{
  Future<ProfileModel> getProfile(){
    ProfileProvider provider = ProfileProvider();
    
    return provider.getProfile();
  }
}