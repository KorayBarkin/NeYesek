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
  @override
  Widget build(BuildContext context) {
    List<String> data = [
      "assets/images/big_1.png",
      "assets/images/big_2.png",
      "assets/images/big_3.png",
      "assets/images/big_4.png",
      "assets/images/cheeseburger.jpg",
      "assets/images/pizza.jpg"
    ];
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

            // Demo list of Big Cards
            ...List.generate(
              // For demo we use 4 items
              3,
              (index) => Padding(
                padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
                child: RestaurantInfoBigCard(
                  // Images are List<String>
                  images: demoBigImages..shuffle(),
                  name: "Ne Yesek Pizza",
                  rating: 8.6,
                  numOfRating: 200,
                  deliveryTime: 25,
                  price: 22.0,
                  foodType: [
                    "Fastfood",
                    "Amerikan",
                  ],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(),
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
