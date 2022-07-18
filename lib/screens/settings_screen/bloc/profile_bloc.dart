import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
import 'package:rick_and_morty_app/models/profile_model.dart';
import 'package:rick_and_morty_app/screens/settings_screen/bloc/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc
    extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(EditprofileBlocInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfileEvent) {
        emit(ProfileLoadingState());
        try {
          ProfileModel profileModel =
              await ProfileRepository().getProfile();

          emit(ProfileLoadedState(profileModelList: profileModel));
        } catch (e) {
          print('Profile bloc error ===== $e');

          emit(ProfileErrorState(CatchException.convertException(e)));
        }
      }
    });
  }
}
