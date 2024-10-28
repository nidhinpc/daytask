import 'package:daytask/utils/color_constants.dart';
import 'package:daytask/utils/image_constants.dart';

import 'package:daytask/view/global_widgets/custom_logo.dart';
import 'package:daytask/view/home_screen/home_screen.dart';

import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 260),
                child: CustomLogo(
                  height: 62,
                  width: 93,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _imageContainer(),
              SizedBox(
                height: 50,
              ),
              _textContainer(),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: CustomButton())
            ],
          ),
        ),
      ),
    );
  }

  Container _textContainer() {
    return Container(
      height: 240,
      width: 376,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageConstants.Textimg))),
    );
  }

  Container _imageContainer() {
    return Container(
      height: 330,
      width: 369,
      decoration: BoxDecoration(
          color: ColorConstants.TextColor,
          image: DecorationImage(image: AssetImage(ImageConstants.FirstImg))),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 376,
      height: 67,
      color: ColorConstants.ButtonColor,
      child: Center(
          child: Text(
        "Let's Start",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      )),
    );
  }
}
