import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/custom_cached_network_image.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/episode_info_screen/episode_info_screen.dart';

class EpisodeContainerWidget extends StatelessWidget {
  final int? quantitySeason;
  final String? imageUrl;
  final String? nameEpisode;
  final int? numEpisode;
  final String? dtEpisode;
  final String? description;

  const EpisodeContainerWidget({
    Key? key,
    required this.quantitySeason,
    required this.imageUrl,
    required this.nameEpisode,
    required this.numEpisode,
    required this.dtEpisode,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EpisodeInfoScreen(
            imageUrl: imageUrl,
            nameEpisode: nameEpisode,
            numEpisode: numEpisode,
            dtEpisode: dtEpisode,
            description: description,
          ),
        ),
      ),
      child: SizedBox(
        width: 343.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCachedNetworkImageWidget(
              isRadius: true,
              radius: BorderRadius.circular(10.r),
              imageUrl: imageUrl!,
              width: 60.w,
              height: 60.h,
            ),
            SizedBox(width: 16.w),
            SizedBox(
              width: 259.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'СЕРИЯ $numEpisode',
                    style: TextStyleHelper.textSeria,
                  ),
                  Text(
                    nameEpisode!,
                    style: TextStyleHelper.nameStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    dtEpisode!,
                    style: TextStyleHelper.dtSeria,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
