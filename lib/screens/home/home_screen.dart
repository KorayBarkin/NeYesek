import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ui_kit/components/current_location.dart';
import '../../constants.dart';
import '../../screens/filter/filter_screen.dart';
import '../../size_config.dart';

import 'components/body.dart';
import '../../components/current_location.dart';
import '../../screens/location/locationChange.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// If you set your home screen as first screen make sure call [SizeConfig().init(context)]
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: SizedBox(),
      title: Column(
        children: [
          Text(
            "Konum".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: kActiveColor),
          ),
          FlatButton(
            child: CurrentLocation(),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LocationChange(),
              ),
            ),
          ),
        ],
      ),
      actions: [
        // Filter Button
        FlatButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FilterScreen(),
            ),
          ),
          child: Text(
            "Filtreler",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }
}
