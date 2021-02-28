import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(),
              Text("Hesap Ayarları", style: kH2TextStyle),
              Text(
                "Hesap ayarlarınızı güncelleyiniz.",
                style: kBodyTextStyle,
              ),
              VerticalSpacing(of: 10),
              ProfileMenuCard(
                svgSrc: "assets/icons/profile.svg",
                title: "Profil Bilgileri",
                subTitle: "Hesap bilgilerinizi değiştirin",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/lock.svg",
                title: "Parola",
                subTitle: "Parolanızı değiştirin",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/card.svg",
                title: "Ödeme Bilgileri",
                subTitle: "Kredi veya banka kartı ekleyin",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/marker.svg",
                title: "Konumlar",
                subTitle: "Konum özelliklerinizi ayarlayın",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/fb.svg",
                title: "Sosyal Medya Hesapları",
                subTitle: "Sosyal medya hesaplarınızı eşleştirin",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/share.svg",
                title: "Arkadaşlarına Öner",
                subTitle: "Tek seferlik 5 lira indirim kuponu kazanın",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
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
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
