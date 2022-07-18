import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';
import 'package:rick_and_morty_app/commons/widgets_state.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/screens/characters_screen/filter_screen/local_widgets/custom_text_widget.dart';

class CharacterFilterScreen extends StatefulWidget {
  const CharacterFilterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterFilterScreen> createState() => _CharacterFilterScreenState();
}

class _CharacterFilterScreenState extends State<CharacterFilterScreen> {
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
                      IsGender.isMan = true;
                      IsGender.isWoman = true;
                      IsGender.isUnknown = true;
                      IsStatus.isAlive = true;
                      IsStatus.isDead = true;
                      IsStatus.isUnknown = true;
                      FilterClear.isClear = false;
                    });
                  },
                  icon: ImageIcon(
                    AssetImage(IconImagesHelper.filterClear),
                    color: ColorsHelper.red,
                    size: 36,
                  ),
                )
              : const SizedBox()
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              const CustomTextWidget(text: 'СТАТУС'),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        IsStatus.isAlive = !IsStatus.isAlive;
                      }),
                      child: Row(
                        children: [
                          Icon(
                            IsStatus.isAlive ? Icons.crop_din : Icons.check_box,
                            color: IsStatus.isAlive
                                ? ColorsHelper.grey3
                                : ColorsHelper.textSeria,
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            'Живой',
                            style: TextStyleHelper.buttonEdit
                                .copyWith(color: ColorsHelper.black1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    InkWell(
                      onTap: () => setState(() {
                        IsStatus.isDead = !IsStatus.isDead;
                      }),
                      child: Row(
                        children: [
                          Icon(
                            IsStatus.isDead ? Icons.crop_din : Icons.check_box,
                            color: IsStatus.isDead
                                ? ColorsHelper.grey3
                                : ColorsHelper.textSeria,
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            'Мертвый',
                            style: TextStyleHelper.buttonEdit
                                .copyWith(color: ColorsHelper.black1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    InkWell(
                      onTap: () => setState(() {
                        IsStatus.isUnknown = !IsStatus.isUnknown;
                      }),
                      child: Row(
                        children: [
                          Icon(
                            IsStatus.isUnknown
                                ? Icons.crop_din
                                : Icons.check_box,
                            color: IsStatus.isUnknown
                                ? ColorsHelper.grey3
                                : ColorsHelper.textSeria,
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            'Неизвестно',
                            style: TextStyleHelper.buttonEdit
                                .copyWith(color: ColorsHelper.black1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36.h),
              Divider(
                color: ColorsHelper.grey6,
                thickness: 2.w,
              ),
              SizedBox(height: 36.h),
              const CustomTextWidget(text: 'ПОЛ'),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => setState(() {
                        IsGender.isMan = !IsGender.isMan;
                      }),
                      child: Row(
                        children: [
                          Icon(
                            IsGender.isMan ? Icons.crop_din : Icons.check_box,
                            color: IsGender.isMan
                                ? ColorsHelper.grey3
                                : ColorsHelper.textSeria,
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            'Мужской',
                            style: TextStyleHelper.buttonEdit
                                .copyWith(color: ColorsHelper.black1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    InkWell(
                      onTap: () => setState(() {
                        IsGender.isWoman = !IsGender.isWoman;
                      }),
                      child: Row(
                        children: [
                          Icon(
                            IsGender.isWoman ? Icons.crop_din : Icons.check_box,
                            color: IsGender.isWoman
                                ? ColorsHelper.grey3
                                : ColorsHelper.textSeria,
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            'Женский',
                            style: TextStyleHelper.buttonEdit
                                .copyWith(color: ColorsHelper.black1),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    InkWell(
                      onTap: () => setState(() {
                        IsGender.isUnknown = !IsGender.isUnknown;
                      }),
                      child: Row(
                        children: [
                          Icon(
                            IsGender.isUnknown
                                ? Icons.crop_din
                                : Icons.check_box,
                            color: IsGender.isUnknown
                                ? ColorsHelper.grey3
                                : ColorsHelper.textSeria,
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            'Неизвестно',
                            style: TextStyleHelper.buttonEdit
                                .copyWith(color: ColorsHelper.black1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
