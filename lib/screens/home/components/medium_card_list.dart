import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/details/details_screen.dart';

import '../../../components/cards/medium/restaurant_info_medium_card.dart';
import '../../../components/scalton/medium_card_scalton.dart';
import '../../../constants.dart';
import '../../../demoData.dart';
import '../../../size_config.dart';

class MediumCardList extends StatefulWidget {
  const MediumCardList({
    Key key,
  }) : super(key: key);

  @override
  _MediumCardListState createState() => _MediumCardListState();
}

class _MediumCardListState extends State<MediumCardList> {
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
    // only for demo
    List data = featuredData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: getProportionateScreenWidth(254),
          child: isLoading
              ? buildFeaturedPartnersLoadingIndicator()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: (data.length - 1) == index ? kDefaultPadding : 0,
                    ),
                    child: RestaurantInfoMediumCard(
                      image: data[index]['image'],
                      name: data[index]['name'],
                      location: data[index]['location'],
                      delivertTime: data[index]['deliveryTime'],
                      rating: data[index]['rating'],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(data: data[index]),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  SingleChildScrollView buildFeaturedPartnersLoadingIndicator() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          2,
          (index) => Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding),
            child: MediumCardScalton(),
          ),
        ),
      ),
    );
  }
}
