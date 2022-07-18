import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/custom_button_widget.dart';
import 'package:rick_and_morty_app/global_widgets/custom_textfield_widget.dart';
import 'package:rick_and_morty_app/screens/settings_screen/screens/info_change_screen/bloc/changeinfo_bloc.dart';

class InfoChangeScreen extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final String? patronymic;

  const InfoChangeScreen({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
  }) : super(key: key);

  @override
  State<InfoChangeScreen> createState() => _InfoChangeScreenState();
}

class _InfoChangeScreenState extends State<InfoChangeScreen> {
  late ChangeInfoBloc changeInfoBloc;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController patronymicController = TextEditingController();

  @override
  void initState() {
    changeInfoBloc = ChangeInfoBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsHelper.black1),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Изменить ФИО',
          style: TextStyleHelper.textCharacter,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 61.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextFieldWidget(
                    value: widget.firstName,
                    nameTextField: 'Имя',
                    hintText: 'Имя',
                    textEditingController: firstNameController,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    value: widget.lastName,
                    nameTextField: 'Фамилия',
                    hintText: 'Фамилия',
                    textEditingController: lastNameController,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFieldWidget(
                    value: widget.patronymic,
                    nameTextField: 'Отчество',
                    hintText: 'Отчество',
                    textEditingController: patronymicController,
                  ),
                ],
              ),
              SizedBox(height: 350.h),
              BlocConsumer<ChangeInfoBloc, ChangeInfoState>(
                bloc: changeInfoBloc,
                listener: (context, state) {
                  if (state is ChangeInfoErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.message.toString(),
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ChangeInfoLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CustomButtonWidget(
                    buttonText: 'Сохранить',
                    function: () => changeInfoBloc.add(
                      PatchChangeInfoEvent(
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        patronymic: patronymicController.text,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
