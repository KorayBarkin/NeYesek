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
            ...List.generate(
              demoItems.length,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: OrderedItemCard(
                  title: demoItems[index]["restaurantName"],
                  description: demoItems[index]["description"],
                  price: demoItems[index]["date"],
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
    );
  }
}

const List<Map> demoItems = [
  {
    "restaurantName": "Berat Özyıldız",
    "description": "4 kişilik rezervasyon",
    "date": "03 / 04 / 2021",
  },
  {
    "restaurantName": "Koray Barkın Cıngı",
    "description": "5 kişilik rezervasyon",
    "date": "19 / 03 / 2021",
  },
  {
    "restaurantName": "Ege Güney Daldaban",
    "description": "6 kişilik rezervasyon",
    "date": "02 / 01 / 2021",
  },
];
