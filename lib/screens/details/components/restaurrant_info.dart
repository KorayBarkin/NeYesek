import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/buttons/secondery_button.dart';
import '../../../components/price_range_and_food_type.dart';
import '../../../components/rating_with_counter.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ne Yesek Pizza",
            style: kH2TextStyle,
            maxLines: 1,
          ),
          VerticalSpacing(of: 10),
          PriceRangeAndFoodtype(
            foodType: [
              "İtalyan",
              "Amerikan",
            ],
          ),
          VerticalSpacing(of: 10),
          RatingWithCounter(rating: 4.3, numOfRating: 200),
          VerticalSpacing(),
          Row(
            children: [
              buildDeliveryInfo(
                iconSrc: "assets/icons/fire.svg",
                text: "En iyi pizzacı!",
                subText: "Bilkent, Ankara",
              ),
              HorizontalSpacing(),
              buildDeliveryInfo(
                iconSrc: "assets/icons/rating.svg",
                text: "Puan",
                subText: "9.4",
              ),
              Spacer(),
              SizedBox(
                width: getProportionateScreenWidth(120),
                child: SeconderyButton(
                  child: Text(
                    "Konum".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: kCaptionTextStyle.copyWith(color: kActiveColor),
                  ),
                  press: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Row buildDeliveryInfo({@required String iconSrc, text, subText}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          iconSrc,
          height: getProportionateScreenWidth(20),
          width: getProportionateScreenWidth(20),
          color: kActiveColor,
        ),
        HorizontalSpacing(of: 10),
        Text.rich(
          TextSpan(
            text: "$text\n",
            style: kSecondaryBodyTextStyle,
            children: [
              TextSpan(
                text: subText,
                style:
                    kCaptionTextStyle.copyWith(fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ],
    );
  }
}
