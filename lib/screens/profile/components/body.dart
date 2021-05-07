import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui_kit/components/buttons/primary_button.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/screens/resturantReport/report_screen.dart';
import 'package:food_ui_kit/size_config.dart';
import '../../manageProfile/manage_screen.dart';
import '../../signIn/components/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../signIn/sign_in_screen.dart';
import './menu.dart';
import '../../reservationMake/reservation_make_screen.dart';
import '../../reservationTake/reservation_take_screen.dart';
import '../../takeReservationScreen/order_details_screen.dart';

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
                "Hesap ayarlarınızı buradan değiştirebilirsiniz.",
                style: kBodyTextStyle,
              ),
              VerticalSpacing(of: 10),
              ProfileMenuCard(
                svgSrc: "assets/icons/profile.svg",
                title: "Profil Bilgileri",
                subTitle: "Hesap bilgilerinizi değiştirin",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => manageScreen(),
                  ),
                ),
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/card.svg",
                title: "Ödeme Bilgileri",
                subTitle: "Kredi veya banka kartı ekleyin",
                press: () {},
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/food.svg",
                title: "Menü",
                subTitle: "Menü bilgilerini ayarlayın",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuScreen(),
                  ),
                ),
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/marker.svg",
                title: "Rezervasyon Al",
                subTitle: "Rezervasyon Alma Ekranı",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReservationMakeScreen(),
                  ),
                ),
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/marker.svg",
                title: "Rezervasyon Onayla",
                subTitle: "Rezervasyon Onaylama Ekranı",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => takeReservationScreen(),
                  ),
                ),
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/food.svg",
                title: "Restoran Raporu Oluştur",
                subTitle: "Aylık ve haftalık rapor oluşturur",
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => reportScreen(),
                  ),
                ),
              ),
              Container(
                width: 400,
                height: 50,
                margin: EdgeInsets.only(top: 180),
                child: RaisedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                    //final GoogleSignInProvider logout =
                    // new GoogleSignInProvider();
                    //logout.logout();
                  },
                  child: Text("ÇIKIŞ YAP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  color: Colors.red[700],
                ),
              )
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
