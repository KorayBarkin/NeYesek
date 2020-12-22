import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../components/buttons/primary_button.dart';
import '../../signIn/sign_in_screen.dart';
import '../../../components/dot_indicators.dart';
import 'onboard_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Spacer(flex: 2),
          Expanded(
            flex: 14,
            child: PageView.builder(
              itemCount: demoData.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) => OnboardContent(
                illustration: demoData[index]["illustration"],
                title: demoData[index]["title"],
                text: demoData[index]["text"],
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(demoData.length,
                (index) => DotIndicator(isActive: index == currentPage)),
          ),
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: PrimaryButton(
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              ),
              text: "Hadi başlayalım",
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

// Demo data for our Onboarding screen
List<Map<String, dynamic>> demoData = [
  {
    "illustration": "assets/Illustrations/Illustrations_1.svg",
    "title": "Yeni restoranlar keşfet!",
    "text": "Hep aynı yemekleri yemekten sıkılmadın mı?",
  },
  {
    "illustration": "assets/Illustrations/Illustrations_2.svg",
    "title": "İstersen evine getirelim!",
    "text":
        "Pandemi süresince evlere ücretsiz paket servislerimiz bulunmaktadır.",
  },
  {
    "illustration": "assets/Illustrations/Illustrations_3.svg",
    "title": "En iyi yemekleri keşfet!",
    "text": "Canın ne yemek istiyorsa en iyi yerden ye!",
  },
];
