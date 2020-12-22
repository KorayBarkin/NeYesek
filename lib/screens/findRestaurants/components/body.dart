import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui_kit/screens/home/home_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/welcome_text.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../components/buttons/secondery_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isLoading = false;

  void getCurrentLocation() async {
    setState(() {
      isLoading = true;
    });
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks != null)
      setState(() {
        isLoading = false;
        // Store your location as you want
        // it to show a SnackBar.
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text(placemarks[0].name)));
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(
              title: "Etrafınızdaki restoranlar: ",
              text:
                  "Etrafınızdaki restoranları keşfetmek için \nayarlardan konum bilginizi açınız.",
            ),

            // Getting Current Location
            SeconderyButton(
              press: getCurrentLocation,
              child: isLoading
                  ? buildLodingIndicator()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/location.svg",
                          height: 24,
                          color: kActiveColor,
                        ),
                        HorizontalSpacing(of: 10),
                        Text(
                          "Anlık konumu kullan",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: kActiveColor),
                        )
                      ],
                    ),
            ),
            VerticalSpacing(),

            // New Address Form
            Form(
              child: Column(
                children: [
                  TextFormField(
                    // onSaved: (value) => _location = value,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: kMainColor),
                    cursorColor: kActiveColor,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/icons/marker.svg",
                          color: kBodyTextColor,
                        ),
                      ),
                      hintText: "Yeni adres giriniz.",
                      contentPadding: kTextFieldPadding,
                    ),
                  ),
                  VerticalSpacing(),
                  PrimaryButton(
                    text: "Devam",
                    press: () {
                      // Use your onw way how you combine both New Address and Current Location
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            VerticalSpacing(),
          ],
        ),
      ),
    );
  }

  SizedBox buildLodingIndicator() {
    return SizedBox(
      height: 24,
      width: 24,
      child: Platform.isAndroid
          ? CircularProgressIndicator()
          : CupertinoActivityIndicator(),
    );
  }
}
