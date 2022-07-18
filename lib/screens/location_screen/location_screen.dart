import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/container_point.dart';
import 'package:rick_and_morty_app/commons/text_descriptions.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/custom_cached_network_image.dart';
import 'package:rick_and_morty_app/global_widgets/quantity_text_widget.dart';
import 'package:rick_and_morty_app/global_widgets/search_textfield.dart';
import 'package:rick_and_morty_app/screens/location_screen/bloc/locations_bloc.dart';
import 'package:rick_and_morty_app/screens/location_screen/filter_screen/location_filter_screen.dart';
import 'package:rick_and_morty_app/screens/location_screen/location_info_screen/info_location_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
      body: BlocConsumer<LocationsBloc, LocationsState>(
        bloc: locationsBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LocationLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LocationErrorState) {
            return Center(
              child: ElevatedButton(
                onPressed: () => locationsBloc.add(GetLocationEvent()),
                child: const Text('Try Again'),
              ),
            );
          }

          if (state is LocationLoadedState) {
            return Padding(
              padding: EdgeInsets.only(left: 16.w, top: 54.h, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchTextFieldWidget(
                    navigation: LocationFilterScreen(),
                    hintText: 'Найти локацию',
                    isIcon: true,
                  ),
                  QuantityTextWidget(
                    text: 'ВСЕГО ЛОКАЦИЙ: ${state.locationModel.length}',
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.locationModel.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => InfoLocationScreen(
                                    imageUrl: state.characterModel[index].image,
                                    nameLocation:
                                        state.locationModel[index].name,
                                    dimension:
                                        state.locationModel[index].dimension,
                                    descrition: Descritions.location,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 343.w,
                              height: 221.h,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffE0E0E0)),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 343.w,
                                    height: 150.h,
                                    child: CustomCachedNetworkImageWidget(
                                      imageUrl:
                                          state.characterModel[index].image,
                                      width: 343.w,
                                      height: 150.h,
                                      radius: BorderRadius.vertical(
                                        top: Radius.circular(20.r),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                        bottom: Radius.circular(20.r),
                                      ),
                                    ),
                                    width: 343.w,
                                    height: 68.h,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 12.h,
                                        left: 16.w,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.locationModel[index].name!,
                                            style: TextStyleHelper.nameStyle
                                                .copyWith(
                                              fontSize: 20.sp,
                                              letterSpacing: 0.15.sp,
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Мир ',
                                                style:
                                                    TextStyleHelper.genderStyle,
                                              ),
                                              ContainerPoint.point,
                                              Text(
                                                ' ${state.locationModel[index].dimension}',
                                                style:
                                                    TextStyleHelper.genderStyle,
                                              ),
                                            ],
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
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 24.h);
                      },
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
