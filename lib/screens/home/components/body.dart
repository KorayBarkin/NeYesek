import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/details/details_screen.dart';
import 'package:food_ui_kit/screens/featured/featurred_screen.dart';

import '../../../components/cards/big/restaurant_info_big_card.dart';
import '../../../constants.dart';
import '../../../components/section_title.dart';
import '../../../screens/home/components/promotion_banner.dart';
import '../../../components/cards/big/big_card_image_slide.dart';
import '../../../demoData.dart';
import '../../../size_config.dart';
import 'medium_card_list.dart';

class Body extends StatelessWidget {
  List data = demoMediumCardData..shuffle();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            VerticalSpacing(of: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BigCardImageSlide(images: demoBigImages),
            ),
            VerticalSpacing(of: 25),
            SectionTitle(
              title: "Ayın restoranları",
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeaturedScreen(),
                ),
              ),
            ),
            VerticalSpacing(of: 15),
            MediumCardList(),
            VerticalSpacing(of: 25),
            // Banner
            PromotionBanner(),
            VerticalSpacing(of: 25),
            SectionTitle(
              title: "Bizim seçtiklerimiz",
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FeaturedScreen(),
                ),
              ),
            ),
            VerticalSpacing(of: 15),
            MediumCardList(),
            VerticalSpacing(of: 25),
            SectionTitle(title: "Tüm restoranlar", press: () {}),
            VerticalSpacing(of: 15),

            // SizedBox(
            //   height: 500,
            //   //width: getProportionateScreenWidth(254),
            //   child: ListView.builder(
            //     //shrinkWrap: true,
            //     //scrollDirection: Axis.vertical,
            //     itemCount: data.length,
            //     itemBuilder: (context, index) => Padding(
            //       padding: const EdgeInsets.fromLTRB(
            //           kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
            //       child: RestaurantInfoBigCard(
            //         image: data[index]['image'],
            //         name: data[index]['name'],
            //         deliveryTime: data[index]['deliveryTime'],
            //         rating: data[index]['rating'],
            //         numOfRating: data[index]['numberOfRaiting'],
            //         foodType: data[index]['foodType'],
            //         press: () => Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => DetailsScreen(data: data[index]),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            //list of Big Cards
            ...List.generate(
              data.length,
              (index) => Padding(
                padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
                child: RestaurantInfoBigCard(
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
            )
          ],
        ),
      ),
    );
  }
}

myListview() {}
