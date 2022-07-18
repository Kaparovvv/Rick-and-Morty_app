import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/images_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';
import 'package:rick_and_morty_app/global_widgets/circle_cached_network_image.dart';
import 'package:rick_and_morty_app/screens/settings_screen/screens/change_username_screen/change_username_screen.dart';
import 'package:rick_and_morty_app/screens/settings_screen/screens/info_change_screen/screens/info_change_screen.dart';
import 'package:rick_and_morty_app/screens/settings_screen/screens/local_widgets/value_listtile_widget.dart';

class EditingScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String patronymic;
  final String userName;
  const EditingScreen({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
    required this.userName,
  }) : super(key: key);

  @override
  State<EditingScreen> createState() => _EditingScreenState();
}

class _EditingScreenState extends State<EditingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsHelper.black1),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Редактировать профиль',
          style: TextStyleHelper.textCharacter,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 41.h, right: 16.w),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleCachedNetworkImageWidget(
                imageUrl: ImagesHelper.userImage,
                width: 150.w,
                height: 150.h,
              ),
              SizedBox(height: 20.h),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Изменить фото',
                  style: TextStyleHelper.buttonEdit,
                ),
              ),
              SizedBox(height: 40.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Профиль',
                    style: TextStyleHelper.textSeria.copyWith(
                      color: ColorsHelper.grey3,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ValueListTileWidget(
                    function: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoChangeScreen(
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          patronymic: widget.patronymic,
                        ),
                      ),
                    ),
                    name: 'Изменить ФИО',
                    value: '${widget.firstName} ${widget.lastName}',
                  ),
                  SizedBox(height: 20.h),
                  ValueListTileWidget(
                    function: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangeUserNameScreen(),
                      ),
                    ),
                    name: 'Логин',
                    value: widget.userName,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
