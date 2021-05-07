import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/buttons/secondery_button.dart';
import '../../../components/price_range_and_food_type.dart';
import '../../../components/rating_with_counter.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../googleMaps/google_maps_screen.dart';

class RestaurantInfo extends StatelessWidget {
  final Map<String, dynamic> data;
  RestaurantInfo({this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['name'],
            style: kH2TextStyle,
            maxLines: 1,
          ),
          VerticalSpacing(of: 10),
          PriceRangeAndFoodtype(foodType: data['foodType']),
          VerticalSpacing(of: 10),
          RatingWithCounter(
              rating: data['rating'], numOfRating: data['numberOfRating']),
          VerticalSpacing(),
          Row(
            children: [
              buildDeliveryInfo(
                iconSrc: "assets/icons/fire.svg",
                text: data['title'],
                subText: data['location'],
              ),
              HorizontalSpacing(),
              buildDeliveryInfo(
                iconSrc: "assets/icons/rating.svg",
                text: "Puan",
                subText: data['rating'].toString(),
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
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GoogleMapsScreen(data: data),
                      ),
                    );
                  },
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
