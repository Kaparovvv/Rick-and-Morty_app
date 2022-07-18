import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

class ValueListTileWidget extends StatelessWidget {
  final String name;
  final String value;
  final Function() function;

  const ValueListTileWidget({
    Key? key,
    required this.function(),
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 1),
        title: Text(
          name,
          style:
              TextStyleHelper.buttonEdit.copyWith(color: ColorsHelper.black1),
        ),
        subtitle: Text(
          value,
          style: TextStyleHelper.textSeria.copyWith(
            color: ColorsHelper.grey3,
            letterSpacing: 0.25.sp,
          ),
        ),
        trailing: Icon(
          Icons.navigate_next,
          color: ColorsHelper.black1,
        ),
      ),
    );
  }
}
