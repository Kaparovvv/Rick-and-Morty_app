import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/global_widgets/custom_cached_network_image.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/episode_info_screen/episode_info_screen.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/episode_info_screen/local_widgets/play_button_widget.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/episode_info_screen/local_widgets/videoplayer_widget.dart';

class CustomStackWidget extends StatelessWidget {
  const CustomStackWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final EpisodeInfoScreen widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CustomCachedNetworkImageWidget(
          isRadius: false,
          imageUrl: widget.imageUrl!,
          width: 1.sw,
          height: 298.h,
        ),
        Container(
          margin: EdgeInsets.only(
            top: 251.h,
          ),
          width: 1.sw,
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(26.r),
            ),
          ),
        ),
        PlayButtonWidget(
          function: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const VideoPlayerWidget(),
            ),
          ),
        ),
      ],
    );
  }
}
