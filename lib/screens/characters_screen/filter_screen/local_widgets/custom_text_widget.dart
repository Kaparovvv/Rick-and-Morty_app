import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

//Виджет тект, указания названия определенных полей параметров
class CustomTextWidget extends StatelessWidget {
  final String text;
  const CustomTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyleHelper.textSeria.copyWith(
        color: ColorsHelper.grey3,
      ),
    );
  }
}