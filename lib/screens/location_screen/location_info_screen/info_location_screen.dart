import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/container_point.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/custom_cached_network_image.dart';
import 'package:rick_and_morty_app/global_widgets/data_container_widget.dart';
import 'package:rick_and_morty_app/screens/characters_screen/info_character_screen/info_character_screen.dart';
import 'package:rick_and_morty_app/screens/location_screen/bloc/locations_bloc.dart';

class InfoLocationScreen extends StatefulWidget {
  final String? imageUrl;
  final String? nameLocation;
  final String? dimension;
  final String? descrition;
  const InfoLocationScreen({
    Key? key,
    required this.imageUrl,
    required this.descrition,
    required this.nameLocation,
    required this.dimension,
  }) : super(key: key);

  @override
  State<InfoLocationScreen> createState() => _InfoLocationScreenState();
}

class _InfoLocationScreenState extends State<InfoLocationScreen> {
  late LocationsBloc locationsBloc;

  @override
  void initState() {
    locationsBloc = LocationsBloc();
    locationsBloc.add(GetLocationEvent());
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
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              CustomCachedNetworkImageWidget(
                isRadius: false,
                imageUrl: widget.imageUrl!,
                width: 1.sw,
                height: 298.h,
              ),
              Container(
                margin: EdgeInsets.only(top: 220.h),
                width: 1.sw,
                height: 600.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(26.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 34.h, right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.nameLocation!,
                        style: TextStyleHelper.nameSizeStyle.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Мир ', style: TextStyleHelper.genderStyle),
                          ContainerPoint.point,
                          Text(' ${widget.dimension}',
                              style: TextStyleHelper.genderStyle),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Text(
                        widget.descrition!,
                        style: TextStyleHelper.descriptionStyle,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 36.h),
                        child: Text(
                          'Персонажи',
                          style: TextStyleHelper.nameStyle.copyWith(
                            fontSize: 20.sp,
                            letterSpacing: 0.15.sp,
                          ),
                        ),
                      ),
                      BlocConsumer<LocationsBloc, LocationsState>(
                        bloc: locationsBloc,
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is LocationLoadingState) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          if (state is LocationErrorState) {
                            return ElevatedButton(
                              onPressed: () =>
                                  locationsBloc.add(GetLocationEvent()),
                              child: const Text('Try Again'),
                            );
                          }
                          if (state is LocationLoadedState) {
                            return SizedBox(
                              width: 1.sw,
                              height: 308.h,
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
                                        description: '',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
