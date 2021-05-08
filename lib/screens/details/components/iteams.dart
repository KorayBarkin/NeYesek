import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/addToOrder/add_to_order_screen.dart';
import '../../../components/cards/iteam_card.dart';
import '../../../constants.dart';

class Items extends StatefulWidget {
  final Map<String, dynamic> data;
  Items({this.data});

  @override
  _ItemsState createState() => _ItemsState(data: data);
}

class _ItemsState extends State<Items> {
  final Map<String, dynamic> data;
  _ItemsState({this.data});

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
          data['menu'].length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding - 5, vertical: kDefaultPadding / 2),
            child: ItemCard(
              title: data['menu'][index]["title"],
              description: data['menu'][index]["description"],
              image: data['menu'][index]["image"],
              foodType: data['menu'][index]['foodType'],
              price: data['menu'][index]["price"],
              rating: data['menu'][index]["rating"],
              press: () {},
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
    child: Text('Burgerler'),
  ),
  Tab(
    child: Text('Pizzalar'),
  ),
  Tab(
    child: Text('Makarnalar'),
  ),
  Tab(
    child: Text('Yan ürünler'),
  ),
];
