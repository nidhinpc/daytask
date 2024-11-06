import 'package:daytask/utils/animation_constants.dart';
import 'package:daytask/utils/color_constants.dart';
import 'package:daytask/view/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OnboardingScreen()));
    });

    return Scaffold(
      backgroundColor: ColorConstants.ButtonColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
          ),
          Center(
            child: Lottie.asset(AnimationConstants.SplashScreenAnimaton,
                height: 300, width: 400),
          ),
          SizedBox(
            height: 200,
          ),
          Text(
            "NOTE APP",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: ColorConstants.TextColor),
          ),
        ],
      ),
    );
  }
}
