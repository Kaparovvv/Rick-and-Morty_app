import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

class ThemeSwitchingWidget extends StatefulWidget {
  const ThemeSwitchingWidget({Key? key}) : super(key: key);

  @override
  State<ThemeSwitchingWidget> createState() => _ThemeSwitchingWidgetState();
}

class _ThemeSwitchingWidgetState extends State<ThemeSwitchingWidget> {
  bool isTheme = true;

  @override
  Widget build(BuildContext context) {
    switchAdaptive(String text) {
      return Row(
        children: [
          Switch.adaptive(
            value: isTheme,
            onChanged: (value) => setState(
              () {
                this.isTheme = !isTheme;
              },
            ),
          ),
          IntrinsicWidth(
            child: Text(
              text,
              style: TextStyleHelper.dtSeria,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );
    }

    return AlertDialog(
      title: const Text('Темная тема'),
      content: Column(
        children: [
          switchAdaptive('Выключенна'),
          switchAdaptive('Включенна'),
          switchAdaptive('Следовать настройкам системы'),
          switchAdaptive('В режиме энергосбережения'),
        ],
      ),
      backgroundColor: ColorsHelper.grey6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      actions: [
        TextButton(
          child: const Text('ОТМЕНА'),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}
