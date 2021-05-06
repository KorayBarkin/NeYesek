import 'package:flutter/material.dart';

import '../components/maps.dart';
import '../../../constants.dart';
import '../../../runningData.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 150,
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
              onPressed: () {
                ChoosenLocation = StartingLocation;
                Navigator.of(context).pop();
              },
            ),
            FlatButton.icon(
              icon: Icon(
                Icons.map,
              ),
              label: Text("Select from map"),
              textColor: kActiveColor,
              onPressed: () {
                if (SelectedFromMaps == null) {
                  _showNotSelectedDialog();
                } else {
                  ChoosenLocation = SelectedFromMaps;
                  SelectedFromMaps = null;
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showNotSelectedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Location not selected on map'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please select a location on map first'),
                Text('To select, tap on map the location you want to select'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
