import 'package:flutter/material.dart';

import '../../location/locationChange.dart';
import '../components/maps.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 500,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Maps(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.location_on,
              ),
              label: Text("Current Location"),
              textColor: kActiveColor,
              onPressed: () {},
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.map,
              ),
              label: Text("Select form map"),
              textColor: kActiveColor,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
