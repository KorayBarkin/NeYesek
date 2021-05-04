import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/size_config.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class report_Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(),
              Text("Ne yesek Pizza", style: kH2TextStyle),
              Text(
                "Your Resturant Details.",
                style: kBodyTextStyle,
              ),
              VerticalSpacing(of: 10),
              ProfileMenuCard(
                svgSrc: "assets/icons/order.svg",
                title: "4.7 / 5",
                subTitle: "Resturant Overall Rating",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/food.svg",
                title: "Cheeseburger",
                subTitle: "Most prefered meal",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/delivery.svg",
                title: "23",
                subTitle: "Total Orders",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/order.svg",
                title: "450 TL",
                subTitle: "Total Income",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    Key key,
    this.title,
    this.subTitle,
    this.svgSrc,
    this.press,
  }) : super(key: key);

  final String title, subTitle, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              SvgPicture.asset(
                svgSrc,
                height: 24,
                width: 24,
                color: kMainColor.withOpacity(0.64),
              ),
              HorizontalSpacing(of: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      style: kSecondaryBodyTextStyle,
                    ),
                    VerticalSpacing(of: 5),
                    Text(
                      subTitle,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: kMainColor.withOpacity(0.54),
                      ),
                    ),
                  ],
                ),
              ),
              HorizontalSpacing(of: 10),
              // Icon(
              //   Icons.arrow_forward_ios_outlined,
              //   size: 20,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
