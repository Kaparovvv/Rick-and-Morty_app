import 'package:flutter/material.dart';

class QuantityTextWidget extends StatelessWidget {
  final String text;
  const QuantityTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff828282),
          fontSize: 10,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}