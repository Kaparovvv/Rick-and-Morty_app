import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/commons/auth_token.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_in_screen.dart/screens/sign_in_screen.dart';
import 'package:rick_and_morty_app/screens/settings_screen/bloc/profile_bloc.dart';
import 'package:rick_and_morty_app/screens/settings_screen/screens/local_widgets/application_data_widget.dart';
import 'package:rick_and_morty_app/screens/settings_screen/screens/local_widgets/button_editing_widget.dart';
import 'package:rick_and_morty_app/screens/settings_screen/screens/local_widgets/info_of_user_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ProfileBloc profileBloc;
  Future exitApp() async {
    var box = Hive.box('tokenBox');

    // String token = await box.get('token', defaultValue: '');

    await box.deleteFromDisk();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SignInScreen(),
      ),
    );
  }

  @override
  void initState() {
    profileBloc = ProfileBloc();
    profileBloc.add(GetProfileEvent());
    AuthToken.token = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Настройки',
          style: TextStyleHelper.textCharacter,
        ),
        actions: [
          IconButton(
            onPressed: () {
              exitApp();
            },
            icon: Icon(
              Icons.exit_to_app_outlined,
              color: ColorsHelper.textSeria,
            ),
          ),
        ],
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        bloc: profileBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileErrorState) {
            return Center(
              child: ElevatedButton(
                onPressed: () => profileBloc.add(GetProfileEvent()),
                child: const Text('Try Again'),
              ),
            );
          }

          if (state is ProfileLoadedState) {
            return Padding(
              padding: EdgeInsets.only(left: 16.w, top: 33.h, right: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        children: [
                          InfoOfUserWidget(
                            firstName: state.profileModelList.firstName!,
                            lastName: state.profileModelList.lastName!,
                            userName: state.profileModelList.username!,
                          ),
                          SizedBox(height: 30.h),
                          ButtonEditingWidget(
                            firstName: state.profileModelList.firstName!,
                            lastName: state.profileModelList.lastName!,
                            patronymic: state.profileModelList.patronymic!,
                            userName: state.profileModelList.username!,
                            textButton: 'Редактировать',
                            width: 335.w,
                            height: 40.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Divider(
                      color: ColorsHelper.grey6,
                      thickness: 2,
                    ),
                    SizedBox(height: 36.h),
                    const ApplicationDataWidget(
                      name: 'Внешний вид',
                      isOrderOfValue: false,
                    ),
                    SizedBox(height: 36.h),
                    Divider(
                      color: ColorsHelper.grey6,
                      thickness: 2,
                    ),
                    SizedBox(height: 36.h),
                    const ApplicationDataWidget(
                      name: 'О приложении',
                      value:
                          'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
                    ),
                    SizedBox(height: 36.h),
                    Divider(
                      color: ColorsHelper.grey6,
                      thickness: 2,
                    ),
                    SizedBox(height: 36.h),
                    const ApplicationDataWidget(
                      name: 'Версия приложения',
                      value: 'Rick & Morty v1.0.0',
                    ),
                    SizedBox(height: 36.h),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}





