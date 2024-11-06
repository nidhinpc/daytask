import 'package:daytask/controller/home_screen_controller.dart';
import 'package:daytask/utils/color_constants.dart';
import 'package:daytask/view/onboarding_screen/onboarding_screen.dart';
import 'package:daytask/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HomeScreenController.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: ColorConstants.Backgroundcolor,
          appBarTheme:
              AppBarTheme(backgroundColor: ColorConstants.Backgroundcolor)),
    );
  }
}
