import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ui_kit/components/bottom_nav_bar.dart';
import 'package:food_ui_kit/screens/googleMaps/google_maps_screen.dart';
import 'package:food_ui_kit/screens/home/home_screen.dart';
import 'package:food_ui_kit/screens/onboarding/onboarding_scrreen.dart';
import 'package:food_ui_kit/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //SystemChrome.setEnabledSystemUIOverlays([]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
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
      home: GoogleMapsScreen(),
      // home: HomeScreen(),
      // home: BottomNavBar(),
    );
  }
}
