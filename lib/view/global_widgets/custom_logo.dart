import 'dart:core';

import 'package:daytask/utils/image_constants.dart';
import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  double width;
  double height;
  CustomLogo({
    required this.width,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageConstants.LOGO))),
    );
  }
}
