import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/name_value_widget.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/episode_info_screen/episode_info_screen.dart';

class DataColumnWidget extends StatelessWidget {
  const DataColumnWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final EpisodeInfoScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 345.w,
          child: Text(
            widget.nameEpisode!,
            textAlign: TextAlign.center,
            style: TextStyleHelper.nameSizeStyle.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          'СЕРИЯ ${widget.numEpisode}',
          style: TextStyleHelper.textSeria,
        ),
        SizedBox(height: 36.h),
        IntrinsicHeight(
          child: Text(
            widget.description!,
            style: TextStyleHelper.descriptionStyle,
          ),
        ),
        SizedBox(height: 24.h),
        NameValueWidget(
          isIconButton: false,
          name: 'Премьера',
          value: widget.dtEpisode!,
        ),
      ],
    );
  }
}
