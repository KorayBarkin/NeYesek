import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/addToOrder/add_to_order_screen.dart';
import '../../../components/cards/iteam_card.dart';
import '../../../constants.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTabController(
          length: demoTabs.length,
          child: TabBar(
            isScrollable: true,
            unselectedLabelColor: kMainColor.withOpacity(0.54),
            labelStyle: kH3TextStyle,
            onTap: (value) {
              // you will get selected tab index
            },
            tabs: demoTabs,
          ),
        ),
        // VerticalSpacing(),
        ...List.generate(
          demoData.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding - 5, vertical: kDefaultPadding / 2),
            child: ItemCard(
              title: demoData[index]["title"],
              description: demoData[index]["description"],
              image: demoData[index]["image"],
              foodType: demoData[index]['foodType'],
              price: demoData[index]["price"],
              priceRange: demoData[index]["priceRange"],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddToOrderScrreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

final List<Tab> demoTabs = <Tab>[
  Tab(
    child: Text('Popüler'),
  ),
  Tab(
    child: Text('Vegan Pizza'),
  ),
  Tab(
    child: Text('New York Pizza'),
  ),
  Tab(
    child: Text('İtalyan  Pizza'),
  ),
  Tab(
    child: Text('Yan ürünler'),
  ),
];

final List<Map<String, dynamic>> demoData = List.generate(
  3,
  (index) => {
    "image": "assets/images/featured _items_${index + 1}.png",
    "title": "New York Pizza",
    "description": "Bol mozeralla ve domates soslu efsane lezzet.",
    "price": 40.0,
    "foodType": "Amerikan",
    "priceRange": "9.8",
  },
);
