import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';
import 'package:rick_and_morty_app/commons/widgets_state.dart';
import 'package:rick_and_morty_app/global_widgets/character_alive_dead.dart';
import 'package:rick_and_morty_app/global_widgets/circle_cached_network_image.dart';
import 'package:rick_and_morty_app/global_widgets/quantity_text_widget.dart';
import 'package:rick_and_morty_app/global_widgets/search_textfield.dart';
import 'package:rick_and_morty_app/screens/characters_screen/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/screens/characters_screen/filter_screen/character_filter_screen.dart';
import '../../commons/text_style.dart';
import 'info_character_screen/info_character_screen.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
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
      body: BlocConsumer<CharactersBloc, CharactersState>(
        listener: (context, state) {},
        bloc: charactersBloc,
        builder: (context, state) {
          if (state is CharacterLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is CharacterErorState) {
            return Center(
              child: ElevatedButton(
                onPressed: () => charactersBloc.add(GetCharacterEvent()),
                child: const Text('Try Again'),
              ),
            );
          }

          if (state is CharacterLoadedState) {
            return Padding(
              padding: EdgeInsets.only(left: 16.w, top: 54.h, right: 16.w),
              child: Column(
                children: [
                  const SearchTextFieldWidget(
                    navigation: CharacterFilterScreen(),
                    hintText: 'Найти персонажа',
                    isIcon: true,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            QuantityTextWidget(
                              text:
                                  'ВСЕГО ПЕРСОНАЖЕЙ: ${state.characterModel.length}',
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 24.h),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    IsColumn.isColumn = !IsColumn.isColumn!;
                                  });
                                },
                                icon: ImageIcon(
                                  AssetImage(
                                    IsColumn.isColumn!
                                        ? IconImagesHelper.menuIcon
                                        : IconImagesHelper.secondMenuIcon,
                                  ),
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                        IsColumn.isColumn!
                            ? Expanded(
                                child: ListView.separated(
                                  itemCount: state.characterModel.length,
                                  itemBuilder: (context, index) => InkWell(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleCachedNetworkImageWidget(
                                          imageUrl:
                                              state.characterModel[index].image,
                                          width: 74.w,
                                          height: 74.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 18.w),
                                          child: SizedBox(
                                            width: 251.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                CharacterAliveOrDead(
                                                    alive: state
                                                        .characterModel[index]
                                                        .status!),
                                                Text(
                                                  state.characterModel[index]
                                                      .name!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      TextStyleHelper.nameStyle,
                                                ),
                                                Text(
                                                  '${state.characterModel[index].species!}, ${state.characterModel[index].gender!}',
                                                  style: TextStyleHelper
                                                      .genderStyle,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              InfoCharacterScreen(
                                            image: state
                                                .characterModel[index].image,
                                            name: state
                                                .characterModel[index].name,
                                            isAlive: state
                                                .characterModel[index].status,
                                            species: state
                                                .characterModel[index].species,
                                            gender: state
                                                .characterModel[index].gender,
                                            description: state
                                                .characterModel[index].desc,
                                            placeOfBirth: state
                                                .characterModel[index].origin
                                                .toString(),
                                            location: state
                                                .characterModel[index].origin
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(height: 24.h);
                                  },
                                ),
                              )
                            : SizedBox(
                                width: 1.sw,
                                height: 562.h,
                                child: GridView.builder(
                                  itemCount: state.characterModel.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemBuilder: (context, index) => InkWell(
                                    child: SizedBox(
                                      width: 164.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleCachedNetworkImageWidget(
                                            imageUrl: state
                                                .characterModel[index].image,
                                            width: 120.w,
                                            height: 120.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              CharacterAliveOrDead(
                                                  alive: state
                                                      .characterModel[index]
                                                      .status!),
                                              Text(
                                                  state.characterModel[index]
                                                      .name!,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyleHelper
                                                      .nameStyle),
                                              Text(
                                                '${state.characterModel[index].species!}, ${state.characterModel[index].gender!}',
                                                style:
                                                    TextStyleHelper.genderStyle,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              InfoCharacterScreen(
                                            image: state
                                                .characterModel[index].image,
                                            name: state
                                                .characterModel[index].name,
                                            isAlive: state
                                                .characterModel[index].status,
                                            species: state
                                                .characterModel[index].species,
                                            gender: state
                                                .characterModel[index].gender,
                                            description: state
                                                .characterModel[index].desc,
                                            placeOfBirth: state
                                                .characterModel[index].origin
                                                .toString(),
                                            location: state
                                                .characterModel[index].origin
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                      ],
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
