import 'package:flutter/material.dart';
import '../../../components/cards/big/restaurant_info_big_card.dart';
import '../../../components/scalton/big_card_scalton.dart';
import '../../../constants.dart';

import '../../../demoData.dart';
import '../../details/details_screen.dart';

/// Just for show the scalton we use [StatefulWidget]
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var data = featuredData;

  bool isLoading = true;

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
          itemCount: isLoading ? 3 : data.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding),
            child: isLoading
                ? BigCardScalton()
                : RestaurantInfoBigCard(
                    image: data[index]['image'],
                    name: data[index]['name'],
                    deliveryTime: data[index]['deliveryTime'],
                    rating: data[index]['rating'],
                    numOfRating: data[index]['numberOfRating'],
                    foodType: data[index]['foodType'],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(data: data[index]),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
