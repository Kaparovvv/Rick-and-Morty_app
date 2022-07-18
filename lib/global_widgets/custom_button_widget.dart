import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final Function() function;
  const CustomButtonWidget({
    Key? key,
    required this.function,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 319.w,
      height: 48.h,
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        child: Text(
          buttonText,
          style: TextStyleHelper.buttonEdit.copyWith(color: ColorsHelper.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            ColorsHelper.textSeria,
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
