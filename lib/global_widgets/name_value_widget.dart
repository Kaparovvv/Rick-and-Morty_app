import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

class NameValueWidget extends StatelessWidget {
  final String? name;
  final String? value;
  final bool isIconButton;
  final Function()? function;
  const NameValueWidget({
    Key? key,
    this.isIconButton = true,
    required this.name,
    required this.value,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function!(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: TextStyleHelper.genderStyle,
              ),
              SizedBox(height: 4.h),
              Text(
                value!,
                style: TextStyleHelper.nameStyle,
              ),
            ],
          ),
          isIconButton
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: ColorsHelper.black1,
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}