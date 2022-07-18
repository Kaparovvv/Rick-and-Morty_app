import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/character_alive_dead.dart';
import 'package:rick_and_morty_app/global_widgets/circle_cached_network_image.dart';

class CustomDataContainerWidget extends StatelessWidget {
  final String? imageUrl;
  final double? imageWeight;
  final double? imageHeight;
  final String? isAlive;
  final String? name;
  final String? species;
  final String? gender;
  final Function()? function;
  const CustomDataContainerWidget({
    Key? key,
    required this.function,
    required this.imageUrl,
    required this.imageWeight,
    required this.imageHeight,
    required this.isAlive,
    required this.name,
    required this.species,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function!(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleCachedNetworkImageWidget(
                imageUrl: imageUrl,
                width: imageWeight!.w,
                height: imageHeight!.h,
              ),
              SizedBox(width: 18.w),
              SizedBox(
                width: 207.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterAliveOrDead(alive: isAlive!),
                    Text(
                      name!,
                      style: TextStyleHelper.nameStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '$species, $gender',
                      style: TextStyleHelper.genderStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: ColorsHelper.black1,
            size: 24,
          ),
        ],
      ),
    );
  }
}
