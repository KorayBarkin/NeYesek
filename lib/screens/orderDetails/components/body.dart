import 'package:flutter/material.dart';
import 'package:food_ui_kit/components/buttons/primary_button.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/screens/details/rating_screen.dart';
import 'package:food_ui_kit/size_config.dart';
import 'package:food_ui_kit/screens/database/reservation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'order_item_card.dart';
import '../../reservationMake/reservation_make_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Reservation> reservationList = [];
  final auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance;
  void initState() {
    super.initState();
    database
        .reference()
        .child("reservations/")
        .once()
        .then((DataSnapshot dataSnapshot) {
      reservationList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for (var key in keys) {
        if (values[key]['customerEmail'] == auth.currentUser.email &&
            values[key]['status'] == true) {
          print(values[key]['customerName']);
          Reservation reservation = new Reservation(
              values[key]['customerName'],
              values[key]['customerEmail'],
              values[key]['restaurantName'],
              values[key]['date'],
              values[key]['reservationDetail'],
              values[key]['status']);
          reservationList.add(reservation);
        }
      }
      setState(() {
        //
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: reservationList.length == 0
          ? Center(
              child: Text(
              "Yüklenirken Lüften Bekleyiniz...",
              style: TextStyle(fontSize: 24),
            ))
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  VerticalSpacing(),
                  ...List.generate(
                    reservationList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
                      child: OrderedItemCard(
                        title: reservationList[index].restaurantName,
                        description: reservationList[index].reservationDetail,
                        price: reservationList[index].date,
                      ),
                    ),
                  ),
                  GestureDetector(
                      child: Text(
                        "Yorum Yap",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.end,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RatingScreen()),
                        );
                      }),
                  VerticalSpacing(of: 40),
                  /*PrimaryButton(
                    text: "Geri Dön",
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReservationMakeScreen(),
                        ),
                      );
                    },
                  ),*/
                ],
              ),
            ),
    );
  }
}
