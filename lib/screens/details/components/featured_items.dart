import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/details/rating_screen.dart';
import 'package:food_ui_kit/screens/comments/comments.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'featured_item_card.dart';

class FeaturedItems extends StatelessWidget {
  final Map<String, dynamic> data;
  FeaturedItems({this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text("Restoranın en iyileri", style: kSubHeadTextStyle),
        ),
        VerticalSpacing(of: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                data['featureMenu'].length, // for demo we use 3
                (index) => Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding - 5),
                  child: FeaturedItemCard(
                    title: data['featureMenu'][index]['title'],
                    image: data['featureMenu'][index]['image'],
                    foodType: data['featureMenu'][index]['foodType'],
                    priceRange:
                        data['featureMenu'][index]['price'].toString() + " TL",
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommentsScreen(),
                      ),
                    ),
                  ),
                ),
              ),
              HorizontalSpacing(),
            ],
          ),
        ),
      ],
    );
  }
}
