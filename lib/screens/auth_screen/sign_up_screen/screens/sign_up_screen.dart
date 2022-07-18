import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/commons/widgets_state.dart';
import 'package:rick_and_morty_app/global_widgets/custom_button_widget.dart';
import 'package:rick_and_morty_app/global_widgets/custom_textfield_widget.dart';
import 'package:rick_and_morty_app/screens/auth_screen/sign_up_screen/bloc/auth_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AuthBloc authBloc;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController patronymicController = TextEditingController();

  @override
  void initState() {
    authBloc = AuthBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsHelper.nameTextField),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Создать аккаунт',
                style: TextStyleHelper.nameSizeStyle.copyWith(
                  color: ColorsHelper.nameTextField,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextFieldWidget(
                textEditingController: firstNameController,
                nameTextField: 'Имя',
                hintText: 'Имя',
              ),
              SizedBox(height: 10.h),
              CustomTextFieldWidget(
                textEditingController: lastNameController,
                nameTextField: 'Фамилия',
                hintText: 'Фамилия',
              ),
              SizedBox(height: 10.h),
              CustomTextFieldWidget(
                textEditingController: patronymicController,
                nameTextField: 'Отчество',
                hintText: 'Отчество',
              ),
              SizedBox(height: 36.h),
              Divider(
                thickness: 2.h,
                color: ColorsHelper.grey6,
              ),
              SizedBox(height: 36.h),
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
              SizedBox(height: 63.h),
              BlocConsumer<AuthBloc, AuthState>(
                bloc: authBloc,
                listener: (context, state) {
                  if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.message.toString(),
                        ),
                      ),
                    );
                  }

                  if (state is AuthLoadedState) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CustomButtonWidget(
                    buttonText: 'Создать',
                    function: () {
                      authBloc.add(
                        AuthSignUpEvent(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          password: passwordController.text,
                          patronymic: patronymicController.text,
                          userName: userNameController.text,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
