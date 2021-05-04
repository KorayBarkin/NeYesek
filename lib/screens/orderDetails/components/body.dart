import 'package:flutter/material.dart';
import 'package:food_ui_kit/components/buttons/primary_button.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/size_config.dart';

import 'order_item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            VerticalSpacing(),
            // List of cart items
            ...List.generate(
              demoItems.length,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: OrderedItemCard(
                  title: demoItems[index]["title"],
                  description: "4 kişilik rezervasyon",
                  numOfItem: demoItems[index]["numOfItem"],
                  price: demoItems[index]["price"],
                ),
              ),
            ),
            //buildPriceRow(text: "Toplam:", price: 102.98),
            //VerticalSpacing(of: 10),
            //buildPriceRow(text: "Bahşiş:", price: 0),
            //VerticalSpacing(of: 10),
            //buildTotal(price: 20),
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
    );
  }

  Row buildTotal({@required double price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text.rich(
          TextSpan(
            text: "Total ",
            style: kBodyTextStyle.copyWith(
                color: kMainColor, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                text: "",
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Text(
          "102.98 TL",
          style: kBodyTextStyle.copyWith(
              color: kMainColor, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Row buildPriceRow({@required String text, @required double price}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: kBodyTextStyle.copyWith(color: kMainColor),
        ),
        Text(
          "$price",
          style: kBodyTextStyle.copyWith(color: kMainColor),
        )
      ],
    );
  }
}

const List<Map> demoItems = [
  {
    "title": "Berat Özyıldız",
    "price": "03 / 04 / 2021",
    "numOfItem": 1,
  },
  {
    "title": "Koray Barkın Cıngı",
    "price": "19 / 03 / 2021",
    "numOfItem": 1,
  },
  {
    "title": "Ege Güney Daldaban",
    "price": "02 / 01 / 2021",
    "numOfItem": 2,
  },
];
