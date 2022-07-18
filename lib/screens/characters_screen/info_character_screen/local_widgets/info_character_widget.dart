import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/character_alive_dead.dart';
import 'package:rick_and_morty_app/global_widgets/name_value_widget.dart';
import 'package:rick_and_morty_app/screens/characters_screen/info_character_screen/info_character_screen.dart';

class InfoCharacterWidget extends StatelessWidget {
  const InfoCharacterWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final InfoCharacterScreen widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        top: 24.h,
        right: 16.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              widget.name!,
              textAlign: TextAlign.center,
              style: TextStyleHelper.nameSizeStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: 4.h),
          Center(
            child: CharacterAliveOrDead(alive: widget.isAlive!),
          ),
          SizedBox(height: 36.h),
          Text(
            widget.description!,
            style: TextStyleHelper.descriptionStyle,
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              NameValueWidget(
                name: 'Пол',
                value: widget.gender!,
                isIconButton: false,
              ),
              SizedBox(width: 118.w),
              NameValueWidget(
                name: 'Расса',
                value: widget.species!,
                isIconButton: false,
              )
            ],
          ),
          SizedBox(height: 20.h),
          NameValueWidget(name: 'Место рождения', value: widget.placeOfBirth!),
          SizedBox(height: 24.h),
          NameValueWidget(name: 'Местоположение', value: widget.location!, ),
          SizedBox(height: 36.h),
        ],
      ),
    );
  }
}
