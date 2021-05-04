import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_ui_kit/components/bottom_nav_bar.dart';
import 'package:food_ui_kit/screens/home/home_screen.dart';
import 'package:food_ui_kit/screens/onboarding/onboarding_scrreen.dart';
import 'package:food_ui_kit/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ne Yesek?',
      theme: buildThemeData(),

      /// On first screen must call [SizeConfig().init(context)]
      //home: OnboardingScreen(),
      //home: HomeScreen(),
      home: BottomNavBar(),
    );
  }
}
