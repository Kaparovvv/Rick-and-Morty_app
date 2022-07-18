import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';

class PlayButtonWidget extends StatelessWidget {
  final Function() function;
  const PlayButtonWidget({
    Key? key,
    required this.function(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 201.h),
      child: InkWell(
        onTap: () => function(),
        child: Container(
          width: 99.w,
          height: 99.h,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 30,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Image.asset(
            IconImagesHelper.playIcon,
          ),
        ),
      ),
    );
  }
}
