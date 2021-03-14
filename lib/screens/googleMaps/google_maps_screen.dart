import "package:flutter/material.dart";
import 'package:food_ui_kit/screens/details/details_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../components/buttons/primary_button.dart';
import '../../constants.dart';
import 'package:permission/permission.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class GoogleMapsScreen extends StatefulWidget {
  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  GoogleMapController _controller;

  var start = LatLng(39.8713623, 32.7641787);
  var destination = LatLng(39.90599, 32.7619113);

  PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
  }

  static final CameraPosition _ctisBuilding = CameraPosition(
    bearing: 180,
    target: LatLng(39.8713623, 32.7641787),
    //tilt: 59.440717697143555,
    zoom: 14.151926040649414,
  );

  _createPolylines(LatLng start, LatLng destination) async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
      var askpermissions =
          await Permission.requestPermissions([PermissionName.Location]);
    } else {
      polylinePoints = PolylinePoints();
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyAL8bPKcw2oua6nTG7aZMiQEedmePscNl0", // Google Maps API Key
        PointLatLng(start.latitude, start.longitude),
        PointLatLng(destination.latitude, destination.longitude),
        travelMode: TravelMode.driving,
      );
      setState(() {
        if (result.points.isNotEmpty) {
          result.points.forEach((PointLatLng point) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          });
        }
        PolylineId id = PolylineId('poly');

        Polyline polyline = Polyline(
            polylineId: id,
            color: Colors.red,
            points: polylineCoordinates,
            width: 3,
            startCap: Cap.roundCap,
            endCap: Cap.buttCap);

        polylines[id] = polyline;
        //print(polyline.points);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              height: 130,
              width: 300,
              child: Image.asset("assets/images/NeYesek_banner.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 5, right: 5),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.black, width: 5.0),
                    bottom: BorderSide(color: Colors.black, width: 5.0))),
            height: MediaQuery.of(context).size.height - 250,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _ctisBuilding,
              //onMapCreated: onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              polylines: Set<Polyline>.of(polylines.values),
              markers: _createMarker(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTapDown: (c) {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x80000000),
                          blurRadius: 10.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                      color: Colors.orange[300]),
                  child: Center(
                    child: Text(
                      'GERİ DÖN',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTapDown: (c) {
                  //MapsLauncher.launchCoordinates(_ctisBuilding.target.latitude, _ctisBuilding.target.longitude);
                  _createPolylines(start, destination);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x80000000),
                          blurRadius: 10.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                      color: Colors.orange[300]),
                  child: Center(
                    child: Text(
                      'BENİ GÖTÜR',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),

              // MaterialButton(
              //   shape: StadiumBorder(),
              //   minWidth: 100,
              //   color: kActiveColor,
              //   child: new Text("Geri Dön"),
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              // ),
              // MaterialButton(
              //   shape: StadiumBorder(),
              //   minWidth: 100,
              //   color: kActiveColor,
              //   child: new Text("Beni Götür"),
              //   onPressed: () {
              //     //Navigator.of(context).pop();
              //   },
              // ),
              // FlatButton.icon(
              //   icon: Icon(Icons.arrow_back),
              //   label: Text("Geri Dön"),
              //   textColor: Colors.blue[900],
              //   onPressed: () {},
              // ),
              // FlatButton.icon(
              //   icon: Icon(
              //     Icons.map,
              //   ),
              //   label: Text("Beni Götür"),
              //   textColor: Colors.blue[900],
              //   onPressed: () {},
              // ),
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

  AppBar buildAppBar(BuildContext context) {
    return AppBar();
  }
}
