import 'package:flutter/material.dart';
import '../../../components/cards/big/restaurant_info_big_card.dart';
import '../../../components/scalton/big_card_scalton.dart';
import '../../../constants.dart';

import '../../../demoData.dart';

/// Just for show the scalton we use [StatefulWidget]
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = true;
  int demoDataLength = 4;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ListView.builder(
          // while we dont have our data bydefault we show 3 scalton
          itemCount: isLoading ? 3 : demoDataLength,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: isLoading
                ? BigCardScalton()
                : RestaurantInfoBigCard(
                    // Images are List<String>
                    images: demoBigImages..shuffle(),
                    name: "Ne Yesek Pizza",
                    rating: 9.6,
                    numOfRating: 200,
                    deliveryTime: 25,
                    foodType: ["Bilkent'in en iyisi!"],
                    press: () {},
                  ),
          ),
        ),
      ),
    );
  }
}
