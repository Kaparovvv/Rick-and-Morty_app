import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';

class TextStyleHelper {
  static TextStyle nameSizeStyle = TextStyle(
    color: ColorsHelper.character,
    fontSize: 34,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static TextStyle nameStyle = TextStyle(
    color: ColorsHelper.character,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
  static TextStyle genderStyle = TextStyle(
    color: ColorsHelper.grey3,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );
}
