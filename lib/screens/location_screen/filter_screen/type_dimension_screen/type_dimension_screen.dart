import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

class TypeDimesionScreen extends StatefulWidget {
  const TypeDimesionScreen({ Key? key }) : super(key: key);

  @override
  State<TypeDimesionScreen> createState() => _TypeDimesionScreenState();
}

class _TypeDimesionScreenState extends State<TypeDimesionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsHelper.black1),
        title: Text(
          'Фильтры',
          style: TextStyleHelper.textCharacter,
        ),
      ),
    );
  }
}