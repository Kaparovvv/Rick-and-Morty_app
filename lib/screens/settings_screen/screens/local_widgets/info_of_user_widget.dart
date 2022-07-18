import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/images_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/circle_cached_network_image.dart';

class InfoOfUserWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String userName;

  const InfoOfUserWidget({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      child: Row(
        children: [
          CircleCachedNetworkImageWidget(
            imageUrl: ImagesHelper.userImage,
            height: 80.h,
            width: 80.w,
          ),
          SizedBox(width: 16.w),
          SizedBox(
            width: 239.w,
            height: 48.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$firstName $lastName',
                  style: TextStyleHelper.nameStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.15.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  userName,
                  style: TextStyleHelper.dtSeria,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
