import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/screens/settings_screen/screens/editing_screen/editing_screen.dart';

class ButtonEditingWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String patronymic;
  final String userName;
  final String textButton;
  final double width;
  final double height;
  const ButtonEditingWidget({
    Key? key,
    required this.textButton,
    required this.width,
    required this.height,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditingScreen(
              firstName: firstName,
              lastName: lastName,
              patronymic: patronymic,
              userName: userName,
            ),
          ),
        ),
        child: Text(
          textButton,
          style: TextStyleHelper.buttonEdit,
        ),
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide(color: ColorsHelper.textSeria),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ),
    );
  }
}
