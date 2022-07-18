import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';

class CharacterAliveOrDead extends StatelessWidget {
  final String alive;
  const CharacterAliveOrDead({Key? key, required this.alive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    aliveCharacter() {
      if (alive == 'Alive') {
        return ColorsHelper.green2;
      } else if (alive == 'Dead') {
        return ColorsHelper.red;
      } else {
        return ColorsHelper.grey4;
      }
    }

    return Text(
      alive,
      style: TextStyle(
        color: aliveCharacter(),
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5.sp,
      ),
    );
  }
}
