import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final String? hintText;
  final bool? isIcon;
  final Widget? navigation;
  const SearchTextFieldWidget({
    Key? key,
    this.navigation,
    required this.hintText,
    this.isIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343.w,
      height: 48.h,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0.5.h),
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff5B6975),
            size: 24,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16.sp,
            color: const Color(0xffBDBDBD),
            letterSpacing: 0.44.sp,
          ),
          suffixIcon: isIcon!
              ? SizedBox(
                  width: 10.w,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 1.w,
                          height: 24.h,
                          color: const Color(0xffBDBDBD),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => navigation!),
                          ),
                          child: ImageIcon(
                            AssetImage(IconImagesHelper.filterIcon),
                            size: 24,
                            color: const Color(0xff5B6975),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
          filled: true,
          fillColor: const Color(0xffF2F2F2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(100.r)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

