import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../price_range_and_food_type.dart';
import '../../rating_with_counter.dart';
import '../../small_dot.dart';
import 'big_card_image_slide.dart';

class RestaurantInfoBigCard extends StatelessWidget {
  final List<String> images, foodType;
  final String name;
  final double rating;
  final int numOfRating, deliveryTime;
  final bool isFreeDelivery;
  final VoidCallback press;
  final double price;

  const RestaurantInfoBigCard({
    Key key,
    @required this.name,
    @required this.rating,
    @required this.numOfRating,
    @required this.deliveryTime,
    this.isFreeDelivery = true,
    @required this.images,
    @required this.foodType,
    @required this.press,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // pass list of images here
          BigCardImageSlide(images: images),
          VerticalSpacing(of: 10),
          Text(name, style: kSubHeadTextStyle),
          PriceRangeAndFoodtype(foodType: foodType),
          VerticalSpacing(of: 5),
          Row(
            children: [
              RatingWithCounter(rating: rating, numOfRating: numOfRating),
              HorizontalSpacing(of: 10),
              SvgPicture.asset(
                "assets/icons/clock.svg",
                height: getProportionateScreenWidth(20),
                width: getProportionateScreenWidth(20),
                color: kMainColor.withOpacity(0.64),
              ),
              HorizontalSpacing(of: 5),
              Text("$deliveryTime dk", style: kCaptionTextStyle),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: SmallDot(),
              ),
              SvgPicture.asset(
                "assets/icons/delivery.svg",
                height: getProportionateScreenWidth(20),
                width: getProportionateScreenWidth(20),
                color: Color(0xFF868686),
              ),
              HorizontalSpacing(of: 5),
              Text(isFreeDelivery ? "Ücretsiz" : "Ücretli",
                  style: kCaptionTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
