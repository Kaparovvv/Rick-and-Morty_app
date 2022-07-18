import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';
import 'package:rick_and_morty_app/commons/widgets_state.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/screens/characters_screen/filter_screen/local_widgets/custom_text_widget.dart';
import 'package:rick_and_morty_app/screens/location_screen/filter_screen/type_dimension_screen/type_dimension_screen.dart';
import 'package:rick_and_morty_app/screens/location_screen/filter_screen/type_location_screen/type_location_screen.dart';

class LocationFilterScreen extends StatefulWidget {
  const LocationFilterScreen({Key? key}) : super(key: key);

  @override
  State<LocationFilterScreen> createState() => _LocationFilterScreenState();
}

class _LocationFilterScreenState extends State<LocationFilterScreen> {
  @override
  void setState(VoidCallback fn) {
    FilterClear.isClear = true;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsHelper.black1),
        title: Text(
          'Фильтры',
          style: TextStyleHelper.textCharacter,
        ),
        actions: [
          FilterClear.isClear
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      IsIconState.isIconState = true;
                      FilterClear.isClear = false;
                    });
                  },
                  icon: ImageIcon(
                    AssetImage(IconImagesHelper.filterClear),
                    color: ColorsHelper.red,
                    size: 36,
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 36.h, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(text: 'Сортировать'),
            SizedBox(height: 29.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'По алфавиту',
                  style: TextStyleHelper.buttonEdit
                      .copyWith(color: ColorsHelper.black1),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          IsIconState.isIconState = !IsIconState.isIconState;
                        });
                      },
                      icon: ImageIcon(
                        AssetImage(IconImagesHelper.chartFirst),
                        color: IsIconState.isIconState
                            ? ColorsHelper.textSeria
                            : ColorsHelper.grey3,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          IsIconState.isIconState = !IsIconState.isIconState;
                        });
                      },
                      icon: ImageIcon(
                        AssetImage(IconImagesHelper.chartSecond),
                        color: IsIconState.isIconState
                            ? ColorsHelper.grey3
                            : ColorsHelper.textSeria,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 41.h),
            Divider(
              color: ColorsHelper.grey6,
              thickness: 2.w,
            ),
            SizedBox(height: 36.h),
            const ListTileWidget(
              navigation: TypeLocationScreen(),
              title: 'Тип',
              subtitle: 'Выберите тип локации',
            ),
            SizedBox(height: 36.h),
            const ListTileWidget(
              navigation: TypeDimesionScreen(),
              title: 'Измерение',
              subtitle: 'Выберите измерения локации',
            ),
          ],
        ),
      ),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? navigation;
  const ListTileWidget({
    Key? key,
    this.navigation,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        title: Text(
          title,
          style:
              TextStyleHelper.buttonEdit.copyWith(color: ColorsHelper.black1),
        ),
        subtitle: Text(subtitle),
        trailing: IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigation!),
          ),
          icon: Icon(
            Icons.keyboard_arrow_right_outlined,
            color: ColorsHelper.black1,
            size: 24,
          ),
        ),
      ),
    );
  }
}
