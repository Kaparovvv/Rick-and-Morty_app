import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';

class TextStyleHelper {
  static TextStyle nameSizeStyle = TextStyle(
    color: ColorsHelper.black1,
    fontSize: 34.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25.sp,
  );
  static TextStyle nameStyle = TextStyle(
    color: ColorsHelper.black1,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5.sp,
  );
  static TextStyle genderStyle = TextStyle(
    color: ColorsHelper.grey3,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5.sp,
  );
  static TextStyle descriptionStyle = TextStyle(
    color: ColorsHelper.black1,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5.sp,
  );
  static TextStyle textTabs = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5.sp,
  );
  static TextStyle textSeria = TextStyle(
    color: ColorsHelper.textSeria,
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.5.sp,
  );
  static TextStyle dtSeria = TextStyle(
    color: ColorsHelper.grey3,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25.sp,
  );
  static TextStyle textCharacter = TextStyle(
    color: ColorsHelper.black1,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15.sp,
  );
  static TextStyle  buttonEdit = TextStyle(
    color: ColorsHelper.textSeria,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15.sp,
  );
  static TextStyle hintText = TextStyle(
    color: ColorsHelper.hintText,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5.sp,
  );
  static TextStyle nameTextField = TextStyle(
    color: ColorsHelper.nameTextField,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25.sp,
  );
   static TextStyle textSignUp = TextStyle(
    color: ColorsHelper.hintText,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25.sp,
  );
  static TextStyle outlinedBtnTxt = TextStyle(
    color: ColorsHelper.textSeria,
    fontSize: 8.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15.sp,
  );
}
