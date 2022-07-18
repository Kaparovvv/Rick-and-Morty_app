import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';
import 'package:rick_and_morty_app/commons/images_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/commons/widgets_state.dart';
import 'package:rick_and_morty_app/global_widgets/custom_button_widget.dart';
import 'package:rick_and_morty_app/global_widgets/custom_textfield_widget.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_in_screen.dart/bloc/sign_in_bloc.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_in_screen.dart/local_widgets/error_dialog_widget.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_up_screen/screens/sign_up_screen.dart';
import 'package:rick_and_morty_app/screens/bottom_navigation/bottom_navigation_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInBloc signInBloc = SignInBloc();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future _openBox() async {
    await Hive.initFlutter();
    await Hive.openBox('tokenBox');
    await Hive.openBox('userNameBox');
  }

  @override
  void initState() {
    _openBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 64.h),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 267.83.w,
                  height: 376.22.h,
                  child: Image.asset(ImagesHelper.authImage),
                ),
                SizedBox(height: 65.h),
                CustomTextFieldWidget(
                  textEditingController: userNameController,
                  nameTextField: 'Логин',
                  hintText: 'Логин',
                  prefixIcon: ImageIcon(
                    AssetImage(IconImagesHelper.loginIcon),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomTextFieldWidget(
                  textEditingController: passwordController,
                  nameTextField: 'Пароль',
                  hintText: 'Пароль',
                  isObscureText: IsObscureText.isObscure,
                  prefixIcon: ImageIcon(
                    AssetImage(IconImagesHelper.passIcon),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        IsObscureText.isObscure = !IsObscureText.isObscure;
                      });
                    },
                    child: IsObscureText.isObscure
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  ),
                ),
                SizedBox(height: 24.h),
                BlocConsumer<SignInBloc, SignInState>(
                  bloc: signInBloc,
                  listener: (context, state) {
                    if (state is SignInErrorState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ErrorDialogWidget(
                            contentTxt: state.message.message!,
                          ),
                        ),
                      );
                    }

                    if (state is SignInLoadedState) {
                      var box = Hive.box('userNameBox');
                      box.put('userName', userNameController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigationWidget(
                            currentIndex: 0,
                          ),
                        ),
                      );
                      userNameController.clear();
                      passwordController.clear();
                    }
                  },
                  builder: (context, state) {
                    if (state is SignInLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButtonWidget(
                      function: () {
                        signInBloc.add(
                          LoginSignInEvent(
                            userName: userNameController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                      buttonText: 'Войти',
                    );
                  },
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'У вас еще нет аккаунта? ',
                      style: TextStyleHelper.textSignUp,
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      ),
                      child: Text(
                        'Создать',
                        style: TextStyleHelper.textSignUp.copyWith(
                          color: ColorsHelper.signUp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
