import 'package:flutter/material.dart';
import 'package:food_ui_kit/components/buttons/primary_button.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_ui_kit/screens/database/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'order_item_card.dart';

class DisplayMenuScreen extends StatefulWidget {
  @override
  _DisplayMenuScreenState createState() => _DisplayMenuScreenState();
}

class _DisplayMenuScreenState extends State<DisplayMenuScreen> {
  List<Product> productList = [];
  final auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance;
  Product pro = new Product(
      "values[key]['name']",
      "values[key]['restaurantName']",
      "values[key]['description']",
      null,
      "values[key]['category']",
      13,
      "values[key]['image']");

  void initState() {
    super.initState();
    database
        .reference()
        .child("products/")
        .once()
        .then((DataSnapshot dataSnapshot) {
      productList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;
      for (var key in keys) {
        if (values[key]['restaurantName'] == "CTIS Burger") {
          Product product = new Product(
              values[key]['name'],
              values[key]['restaurantName'],
              values[key]['description'],
              null,
              values[key]['category'],
              values[key]['price'].toDouble(),
              null);
          productList.add(product);
        }
      }
      setState(() {
        //
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Center(
          child: Container(
            height: 130,
            width: 300,
            child: Image.asset("assets/images/NeYesek_banner.png"),
          ),
        ),
        SingleChildScrollView(
          child: productList.length == 0
              ? Center(
                  child: Text(
                  "Yüklenirken Lüften Bekleyiniz...",
                  style: TextStyle(fontSize: 24),
                ))
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    children: [
                      VerticalSpacing(),
                      ...List.generate(
                        productList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: kDefaultPadding / 2),
                          child: OrderedItemCard(
                            title: productList[index].name,
                            description: productList[index].description,
                            price: productList[index].price.toString() + " ₺",
                          ),
                        ),
                      ),
                      VerticalSpacing(of: 40),
                      PrimaryButton(
                        text: "Geri Dön",
                        press: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
        ),
      ],
    ));
  }
}
