import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

class ErrorDialogWidget extends StatelessWidget {
  final String contentTxt;
  const ErrorDialogWidget({Key? key, required this.contentTxt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 319.w,
      height: 188.h,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          'Ошибка',
          style: TextStyleHelper.textCharacter,
        ),
        content: Text(
          contentTxt,
          style: TextStyleHelper.nameTextField,
        ),
        actions: [
          Center(
            child: SizedBox(
              width: 259.w,
              height: 40.h,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Oк',
                  style: TextStyleHelper.outlinedBtnTxt,
                ),
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide(color: ColorsHelper.textSeria)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
