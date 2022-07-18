import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/screens/settings_screen/screens/local_widgets/theme_switching_widget.dart';

class ApplicationDataWidget extends StatelessWidget {
  final String? name;
  final String? value;
  final bool? isOrderOfValue;

  const ApplicationDataWidget({
    Key? key,
    this.isOrderOfValue = true,
    required this.name,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name!,
          style: TextStyleHelper.textSeria.copyWith(
            color: ColorsHelper.grey3,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 24.h),
          child: isOrderOfValue!
              ? IntrinsicWidth(
                  child: Text(
                    value!,
                    style: TextStyleHelper.descriptionStyle
                        .copyWith(letterSpacing: 0.25.sp),
                  ),
                )
              : InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThemeSwitchingWidget(),
                    ),
                  ),
                  child: SizedBox(
                    height: 44.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 36.w,
                              height: 36.h,
                              child: Image.asset(
                                IconImagesHelper.paletteIcon,
                              ),
                            ),
                            SizedBox(width: 20.5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Темная тема',
                                  style: TextStyleHelper.buttonEdit
                                      .copyWith(color: ColorsHelper.black1),
                                ),
                                Text(
                                  'Выключена',
                                  style: TextStyleHelper.textSeria.copyWith(
                                    color: ColorsHelper.grey3,
                                    letterSpacing: 0.25.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.navigate_next,
                          color: ColorsHelper.black1,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
