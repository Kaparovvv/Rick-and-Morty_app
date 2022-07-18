import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_descriptions.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/search_textfield.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/bloc/episodes_bloc.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/local_widgets/episode_container.dart';
import 'package:rick_and_morty_app/screens/location_screen/bloc/locations_bloc.dart';

class EpisodesScreen extends StatefulWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  State<EpisodesScreen> createState() => _EpisodesScreenState();
}

class _EpisodesScreenState extends State<EpisodesScreen>
    with SingleTickerProviderStateMixin {
  late EpisodesBloc episodesBloc;
  late TabController _tabController;
  int index = 0;

  @override
  void initState() {
    episodesBloc = EpisodesBloc();
    episodesBloc.add(GetEpisodesEvent());
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EpisodesBloc, EpisodesState>(
        bloc: episodesBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is EpisodesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LocationErrorState) {
            return Center(
              child: ElevatedButton(
                onPressed: () => episodesBloc.add(GetEpisodesEvent()),
                child: const Text('Try Again'),
              ),
            );
          }

          if (state is EpisodesLoadedState) {
            return Padding(
              padding: EdgeInsets.only(
                top: 54.h,
              ),
              child: Column(
                children: [
                  const SearchTextFieldWidget(
                    hintText: 'Найти эпизод',
                    isIcon: false,
                  ),
                  SizedBox(height: 15.h),
                  TabBar(
                    controller: _tabController,
                    unselectedLabelColor: ColorsHelper.grey4,
                    labelColor: ColorsHelper.black1,
                    indicatorColor: ColorsHelper.black1,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 2,
                    tabs: [
                      Text(
                        'СЕЗОН 1',
                        // 'СЕЗОН ${state.episodeModelList[index].quantitySeason}',
                        style: TextStyleHelper.textTabs,
                      ),
                      Text(
                        'СЕЗОН 2',
                        // 'СЕЗОН ${state.episodeModelList[index].quantitySeason}',
                        style: TextStyleHelper.textTabs,
                      ),
                      Text(
                        'СЕЗОН 3',
                        // 'СЕЗОН ${state.episodeModelList[index].quantitySeason}',
                        style: TextStyleHelper.textTabs,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.separated(
                            itemCount: state.episodeModelList.length,
                            itemBuilder: (context, index) =>
                                EpisodeContainerWidget(
                                  description: Descritions.episode,
                              // description:
                              //     state.episodeModelList[index].description,
                              dtEpisode:
                                  state.episodeModelList[index].airDate!.month.toString(),
                              imageUrl: state.episodeModelList[index].image,
                              nameEpisode:
                                  state.episodeModelList[index].name,
                              numEpisode:
                                  state.episodeModelList[index].id,
                              quantitySeason: 1,
                                  // state.episodeModelList[index].quantitySeason,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 24.h);
                            },
                          ),
                          ListView.separated(
                            itemCount: state.episodeModelList.length,
                            itemBuilder: (context, index) =>
                                EpisodeContainerWidget(
                              description: Descritions.episode,
                              // description:
                              //     state.episodeModelList[index].description,
                              dtEpisode:
                                  state.episodeModelList[index].airDate!.month.toString(),
                              imageUrl: state.episodeModelList[index].image,
                              nameEpisode:
                                  state.episodeModelList[index].name,
                              numEpisode:
                                  state.episodeModelList[index].id,
                              quantitySeason: 1,
                                  // state.episodeModelList[index].quantitySeason,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 24.h);
                            },
                          ),
                          ListView.separated(
                            itemCount: state.episodeModelList.length,
                            itemBuilder: (context, index) =>
                                EpisodeContainerWidget(
                              description: Descritions.episode,
                              // description:
                              //     state.episodeModelList[index].description,
                              dtEpisode:
                                  state.episodeModelList[index].airDate!.month.toString(),
                              imageUrl: state.episodeModelList[index].image,
                              nameEpisode:
                                  state.episodeModelList[index].name,
                              numEpisode:
                                  state.episodeModelList[index].id,
                              quantitySeason: 1,
                                  // state.episodeModelList[index].quantitySeason,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(height: 24.h);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
