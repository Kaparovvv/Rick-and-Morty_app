import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

//Переиспользуемый виджет для фильтра поиска по параметрам
// ignore: must_be_immutable
class ParamatersFilterWidget extends StatefulWidget {
  bool isBool;
  final String? title;
  ParamatersFilterWidget({
    Key? key,
    required this.isBool,
    required this.title,
  }) : super(key: key);

  @override
  State<ParamatersFilterWidget> createState() => _ParamatersFilterWidgetState();
}

class _ParamatersFilterWidgetState extends State<ParamatersFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.isBool ? Icons.crop_din : Icons.check_box,
          color: widget.isBool ? ColorsHelper.grey3 : ColorsHelper.textSeria,
        ),
        SizedBox(width: 16.w),
        TextButton(
          onPressed: () {
            setState(() {
              widget.isBool = !widget.isBool;
            });
          },
          child: Text(
            widget.title!,
            style:
                TextStyleHelper.buttonEdit.copyWith(color: ColorsHelper.black1),
          ),
        ),
      ],
    );
  }
}
