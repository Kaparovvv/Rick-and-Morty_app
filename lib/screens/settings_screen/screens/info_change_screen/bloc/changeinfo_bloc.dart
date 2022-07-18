import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/helpers/catch_exception.dart';
import 'package:rick_and_morty_app/screens/settings_screen/screens/info_change_screen/bloc/changeinfo_repository.dart';

part 'changeinfo_event.dart';
part 'changeinfo_state.dart';

class ChangeInfoBloc extends Bloc<ChangeInfoEvent, ChangeInfoState> {
  ChangeInfoBloc() : super(ChangeinfoInitial()) {
    on<PatchChangeInfoEvent>((event, emit) async {
      emit(ChangeInfoLoadingState());
      try {
        await ChangeInfoRepository().patchUser(
          firstName: event.firstName,
          lastName: event.lastName,
          patronymic: event.patronymic,
        );

        emit(ChangeInfoLoadedState());
      } catch (e) {
        print('ChangeInfo error bloc ====== $e');

        emit(ChangeInfoErrorState(message: CatchException.convertException(e)));
      }
    });
  }
}
