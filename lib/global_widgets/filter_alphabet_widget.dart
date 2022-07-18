//Переиспользуемый виджет для сортировки в алфавитном порядке
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/icon_images_helper.dart';
import 'package:rick_and_morty_app/commons/widgets_state.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

class FilterAlphabeticalliyWidget extends StatefulWidget {
  const FilterAlphabeticalliyWidget({Key? key}) : super(key: key);

  @override
  State<FilterAlphabeticalliyWidget> createState() =>
      _FilterAlphabeticalliyWidgetState();
}

class _FilterAlphabeticalliyWidgetState
    extends State<FilterAlphabeticalliyWidget> {
  @override
  void setState(VoidCallback fn) {
    FilterClear.isClear = true;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'По алфавиту',
          style:
              TextStyleHelper.buttonEdit.copyWith(color: ColorsHelper.black1),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  IsIconState.isIconState = !IsIconState.isIconState;
                });
              },
              icon: ImageIcon(
                AssetImage(IconImagesHelper.chartFirst),
                color: IsIconState.isIconState
                    ? ColorsHelper.textSeria
                    : ColorsHelper.grey3,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  IsIconState.isIconState = !IsIconState.isIconState;
                });
              },
              icon: ImageIcon(
                AssetImage(IconImagesHelper.chartSecond),
                color: IsIconState.isIconState
                    ? ColorsHelper.grey3
                    : ColorsHelper.textSeria,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
