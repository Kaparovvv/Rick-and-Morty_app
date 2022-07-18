import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/commons/colors_helper.dart';
import 'package:rick_and_morty_app/commons/text_style.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String? nameTextField;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscureText;
  final TextEditingController? textEditingController;
  final String? value;

  const CustomTextFieldWidget({
    Key? key,
    this.textEditingController,
    this.suffixIcon,
    this.prefixIcon,
    this.isObscureText = false,
    required this.nameTextField,
    required this.hintText,
    this.value,
  }) : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  void initState() {
    widget.textEditingController?.text = widget.value ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.nameTextField!,
          style: TextStyleHelper.nameTextField,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 319.w,
          height: 48.h,
          child: TextField(
            textInputAction: TextInputAction.next,
            controller: widget.textEditingController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
              filled: true,
              fillColor: ColorsHelper.grey6,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyleHelper.hintText,
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
            ),
            obscureText: widget.isObscureText ? true : false,
          ),
        ),
      ],
    );
  }
}
