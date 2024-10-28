import 'dart:ui';

import 'package:daytask/utils/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  CustomTextfield({
    required this.controller,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: ColorConstants.TextColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorConstants.Textfieldcolor,
        hintText: text,
        hintStyle: TextStyle(color: ColorConstants.Textfieldtext),
      ),
    );
  }
}
