import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/images_helper.dart';
import 'package:rick_and_morty_app/commons/text_descriptions.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/circle_cached_network_image.dart';
import 'package:rick_and_morty_app/screens/characters_screen/info_character_screen/local_widgets/info_character_widget.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/bloc/episodes_bloc.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/local_widgets/episode_container.dart';

class InfoCharacterScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final String? isAlive;
  final String? species;
  final String? gender;
  final String? description;
  final String? placeOfBirth;
  final String? location;

  const InfoCharacterScreen({
    Key? key,
    required this.image,
    required this.name,
    required this.isAlive,
    required this.species,
    required this.gender,
    required this.description,
    required this.placeOfBirth,
    required this.location,
  }) : super(key: key);

  @override
  State<InfoCharacterScreen> createState() => _InfoCharacterScreenState();
}

class _InfoCharacterScreenState extends State<InfoCharacterScreen> {
  late EpisodesBloc episodesBloc;

  @override
  void initState() {
    episodesBloc = EpisodesBloc();
    episodesBloc.add(GetEpisodesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ClipRRect _clipRRect = ClipRRect(
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Image.network(
          widget.image!,
          fit: BoxFit.cover,
        ),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 218.h,
                  child: CachedNetworkImage(
                    imageUrl: widget.image!,
                    imageBuilder: (context, imageProvider) => _clipRRect,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 138.h),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.r),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: CircleCachedNetworkImageWidget(
                          imageUrl: widget.image,
                          width: 146.w,
                          height: 146.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InfoCharacterWidget(widget: widget),
            Divider(
              color: ColorsHelper.grey6,
              thickness: 2.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 36.h, right: 16.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Эпизоды',
                        style: TextStyleHelper.nameStyle.copyWith(
                          fontSize: 20.sp,
                          letterSpacing: 0.15.sp,
                        ),
                      ),
                      Text(
                        'Все эпизоды',
                        style: TextStyleHelper.genderStyle,
                      ),
                    ],
                  ),
                  BlocConsumer(
                    bloc: episodesBloc,
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is EpisodesLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is EpisodesErrorState) {
                        return Center(
                          child: ElevatedButton(
                            onPressed: () =>
                                episodesBloc.add(GetEpisodesEvent()),
                            child: const Text('Try again'),
                          ),
                        );
                      }

                      if (state is EpisodesLoadedState) {
                        return SizedBox(
                          width: 1.sw,
                          height: 300.h,
                          child: ListView.separated(
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.episodeModelList.length,
                            itemBuilder: (context, index) =>
                                EpisodeContainerWidget(
                                    quantitySeason: 1,
                                    // state.episodeModelList[index].quantitySeason,
                                    imageUrl: ImagesHelper.episode,
                                    // imageUrl: state.episodeModelList[index].imageUrl,
                                    nameEpisode:
                                        state.episodeModelList[index].name,
                                    numEpisode:
                                        state.episodeModelList[index].id,
                                    dtEpisode: state
                                        .episodeModelList[index].airDate
                                        .toString(),
                                    description: Descritions.episode
                                    // description: state.episodeModelList[index].,

                                    ),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 24.h);
                            },
                          ),
                        );
                      }
                      return const Center(
                        child: Text('Error'),
                      );
                    },
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
