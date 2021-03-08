import "package:flutter/material.dart";
import 'package:food_ui_kit/screens/details/details_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  static final CameraPosition _ctisBuilding = CameraPosition(
      bearing: 180,
      target: LatLng(39.8713623, 32.7641787),
      //tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              "Ne Yesek",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 5, right: 5),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 5.0))),
            height: 550,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _ctisBuilding,
              onMapCreated: (map) {},
              markers: _createMarker(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.arrow_back),
                label: Text("Geri Dön"),
                textColor: Colors.blue[900],
                onPressed: () {},
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.map,
                ),
                label: Text("Beni Götür"),
                textColor: Colors.blue[900],
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId("Bilkent CTIS"),
          position: _ctisBuilding.target,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed))
    ].toSet();
  }
}
