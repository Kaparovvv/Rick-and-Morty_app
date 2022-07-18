import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/data_container_widget.dart';
import 'package:rick_and_morty_app/screens/characters_screen/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/screens/characters_screen/info_character_screen/info_character_screen.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/episode_info_screen/local_widgets/custom_stack_widget.dart';
import 'package:rick_and_morty_app/screens/episodes_screen/episode_info_screen/local_widgets/data_column_widget.dart';

class EpisodeInfoScreen extends StatefulWidget {
  final String? imageUrl;
  final String? nameEpisode;
  final int? numEpisode;
  final String? dtEpisode;
  final String? description;

  const EpisodeInfoScreen({
    Key? key,
    required this.imageUrl,
    required this.nameEpisode,
    required this.numEpisode,
    required this.dtEpisode,
    required this.description,
  }) : super(key: key);

  @override
  State<EpisodeInfoScreen> createState() => _EpisodeInfoScreenState();
}

class _EpisodeInfoScreenState extends State<EpisodeInfoScreen> {
  late CharactersBloc charactersBloc;
  @override
  void initState() {
    charactersBloc = CharactersBloc();
    charactersBloc.add(GetCharacterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomStackWidget(widget: widget),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: DataColumnWidget(
                    widget: widget,
                  ),
                ),
                SizedBox(height: 36.h),
                Divider(
                  color: ColorsHelper.grey6,
                  thickness: 2.h,
                ),
                SizedBox(height: 36.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Персонажи',
                        style: TextStyleHelper.textCharacter,
                      ),
                      BlocConsumer<CharactersBloc, CharactersState>(
                        bloc: charactersBloc,
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is CharacterLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state is CharacterErorState) {
                            return ElevatedButton(
                              onPressed: () =>
                                  charactersBloc.add(GetCharacterEvent()),
                              child: const Text('Try Again'),
                            );
                          }
                          if (state is CharacterLoadedState) {
                            return SizedBox(
                              width: 1.sw,
                              height: 200.h,
                              child: ListView.separated(
                                itemCount: state.characterModel.length,
                                itemBuilder: (context, index) =>
                                    CustomDataContainerWidget(
                                  function: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InfoCharacterScreen(
                                        image:
                                            state.characterModel[index].image,
                                        name: state.characterModel[index].name,
                                        isAlive:
                                            state.characterModel[index].status,
                                        species:
                                            state.characterModel[index].species,
                                        gender:
                                            state.characterModel[index].gender,
                                        description:
                                            state.characterModel[index].desc,
                                        placeOfBirth: '',
                                        location: '',
                                      ),
                                    ),
                                  ),
                                  imageUrl: state.characterModel[index].image,
                                  imageWeight: 74,
                                  imageHeight: 74,
                                  isAlive: state.characterModel[index].status,
                                  name: state.characterModel[index].name,
                                  species: state.characterModel[index].species,
                                  gender: state.characterModel[index].gender,
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
          ],
        ),
      ),
    );
  }
}
