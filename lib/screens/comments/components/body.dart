import 'package:flutter/material.dart';
import 'package:food_ui_kit/components/buttons/primary_button.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/screens/details/rating_screen.dart';
import 'package:food_ui_kit/size_config.dart';
import 'package:food_ui_kit/screens/database/reservation.dart';
import 'package:food_ui_kit/screens/database/comment.dart';
import 'package:food_ui_kit/screens/database/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'order_item_card.dart';
import '../../reservationMake/reservation_make_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Comment> commentList = [];
  final auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance;
  Comment cmm = new Comment("eee", "rrrr", 11);

  void initState() {
    super.initState();
    database
        .reference()
        .child("products/-MYfha1ZQ4XrdjkEcRCN/comments/")
        .once()
        .then((DataSnapshot dataSnapshot) {
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for (var key in keys) {
        Comment comment = new Comment(values[key]['evaluator'],
            values[key]['comment'], values[key]['rating']);
        commentList.add(comment);
      }
      setState(() {
        //
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: commentList.length == 0
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
                    commentList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
                      child: OrderedItemCard(
                        title: commentList[index].evaluator,
                        description: commentList[index].comment,
                        price: "★ " + commentList[index].rating.toString(),
                      ),
                    ),
                  ),
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
