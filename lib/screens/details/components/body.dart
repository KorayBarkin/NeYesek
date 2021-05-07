import 'package:flutter/material.dart';
import 'package:food_ui_kit/size_config.dart';

import 'featured_items.dart';
import 'iteams.dart';
import 'restaurrant_info.dart';

class Body extends StatelessWidget {
  final Map<String, dynamic> data;
  Body({this.data});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSpacing(of: 10),
            RestaurantInfo(data: data),
            VerticalSpacing(),
            FeaturedItems(data: data),
            Items(data: data),
          ],
        ),
      ),
    );
  }
}
