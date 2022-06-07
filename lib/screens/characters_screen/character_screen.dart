import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';
import 'package:rick_and_morty_app/commons/is_column.dart';
import 'package:rick_and_morty_app/screens/characters_screen/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/widgets/quatity_text_widget.dart';

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
      body: BlocBuilder<CharactersBloc, CharactersState>(
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
            return ListView.separated(
              shrinkWrap: true,
              itemCount: state.characterModelList.length,
              itemBuilder: (context, index) {
                print('state ===== $state');
                return Padding(
                  padding: const EdgeInsets.only(left: 16, top: 54, right: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9147,
                        height: MediaQuery.of(context).size.height * 0.0591,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0.5),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Color(0xff5B6975),
                              size: 24,
                            ),
                            hintText: 'Найти персонажа',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Color(0xffBDBDBD),
                              letterSpacing: 0.44,
                            ),
                            suffixIcon: SizedBox(
                              width: 10,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.0296,
                                      color: const Color(0xffBDBDBD),
                                    ),
                                    ImageIcon(
                                      AssetImage(IconImagesHelper.filterIcon),
                                      size: 24,
                                      color: const Color(0xff5B6975),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: const Color(0xffF2F2F2),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                QuantityTextWidget(
                                    text:
                                        'ВСЕГО ПЕРСОНАЖЕЙ: ${state.characterModelList.length}'),
                                Padding(
                                  padding: const EdgeInsets.only(top: 24),
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
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: CharactersWidget(
                                // name: state.characterModelList[index].name,
                                // imageUrl:
                                //     state.characterModelList[index].imageUrl,
                                // isAlive:
                                //     state.characterModelList[index].isAlive,
                                // species:
                                //     state.characterModelList[index].species,
                                // location:
                                //     state.characterModelList[index].location,
                                // description:
                                //     state.characterModelList[index].description,
                                // placeOfBirth: state
                                //     .characterModelList[index].placeOfBirth,
                                // gender: state.characterModelList[index].gender,
                                isOrder: IsColumn.isColumn!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 30);
              },
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

class CharactersWidget extends StatelessWidget {
  final bool isOrder;
  final String? imageUrl;
  final String? name;
  final String? isAlive;
  final String? species;
  final String? gender;
  final String? description;
  final String? placeOfBirth;
  final String? location;

  const CharactersWidget({
    Key? key,
    required this.isOrder,
    this.imageUrl,
    this.name,
    this.isAlive,
    this.species,
    this.gender,
    this.description,
    this.placeOfBirth,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String? name = characterModelList.first.name!;
    // String? image = characterModelList[index].imageUrl;
    // String? aliveOrDead = characterModelList.first.aliveOrDead!;
    // String? species = characterModelList.first.species!;
    // String? gender = characterModelList.first.gender!;
    // String? description = characterModelList.first.description!;
    // String? placeOfBirth = characterModelList.first.placeOfBirth!;
    // String? location = characterModelList.first.location!;

    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) =>  InfoCharacterScreen(
        //       image: image,
        //       name: name,
        //       aliveOrDead: aliveOrDead,
        //       species: species,
        //       gender: gender,
        //       description: description,
        //       placeOfBirth: placeOfBirth,
        //       location: location,
        //     ),
        //   ),
        // );
      },
      child: isOrder
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.9147,
              height: MediaQuery.of(context).size.height * 0.0911,
              child: ListTile(
                leading: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1973,
                  height: MediaQuery.of(context).size.height * 0.0911,
                  child: CircleAvatar(
                    child: Image.asset(imageUrl!),
                  ),
                ),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.1973,
              //       height: MediaQuery.of(context).size.height * 0.0911,
              //       child: CircleAvatar(
              //         child: Image.asset(image),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 18),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           CharacterAliveOrDead(alive: aliveOrDead),
              //           Text(name, style: TextStyleHelper.nameStyle),
              //           Text('$species, $gender',
              //               style: TextStyleHelper.genderStyle),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              //   )
              // : SizedBox(
              //     width: MediaQuery.of(context).size.width * 0.4373,
              //     height: MediaQuery.of(context).size.height * 0.2365,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         SizedBox(
              //           width: MediaQuery.of(context).size.width * 0.32,
              //           height: MediaQuery.of(context).size.height * 0.1478,
              //           child: CircleAvatar(
              //             child: Image.asset(image),
              //           ),
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             CharacterAliveOrDead(alive: aliveOrDead),
              //             Text(name, style: TextStyleHelper.nameStyle),
              //             Text('$species, $gender',
              //                 style: TextStyleHelper.genderStyle,),
              //       ],
              //     ),
              //   ],
              // ),
            )
          : const Text(''),
    );
  }
}

class CharacterAliveOrDead extends StatelessWidget {
  final String alive;
  const CharacterAliveOrDead({Key? key, required this.alive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    aliveCharacter() {
      if (alive == 'живой') {
        return ColorsHelper.green2;
      } else {
        return ColorsHelper.red;
      }
    }

    return Text(
      alive,
      style: TextStyle(
        color: aliveCharacter(),
        fontSize: 10,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
      ),
    );
  }
}
