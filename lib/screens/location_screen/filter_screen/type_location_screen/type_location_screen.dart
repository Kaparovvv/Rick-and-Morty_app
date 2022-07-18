import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

class TypeLocationScreen extends StatefulWidget {
  const TypeLocationScreen({Key? key}) : super(key: key);

  @override
  State<TypeLocationScreen> createState() => _TypeLocationScreenState();
}

class _TypeLocationScreenState extends State<TypeLocationScreen> {
  void isStateText() {
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsHelper.black1),
        title: Text(
          'Выберите тип',
          style: TextStyleHelper.textCharacter,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 48.h, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Не выбрано',
              style: TextStyleHelper.buttonEdit
                  .copyWith(color: ColorsHelper.black1),
            ),
            Divider(
              color: ColorsHelper.grey6,
              thickness: 2.w,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Микровселенная',
                style: TextStyleHelper.buttonEdit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String text;
  const CustomTextButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyleHelper.buttonEdit.copyWith(color: ColorsHelper.black1),
      ),
    );
  }
}
