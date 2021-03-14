import "package:flutter/material.dart";
import 'package:food_ui_kit/screens/details/details_screen.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../components/buttons/primary_button.dart';
import '../../constants.dart';
import 'package:permission/permission.dart';

class GoogleMapsScreen extends StatefulWidget {
  @override
  _GoogleMapsScreenState createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  GoogleMapController _controller;
  final Set<Polyline> polylines = {};
  List<LatLng> routeCoordinates;
  GoogleMapPolyline googleMapPolyline =
      new GoogleMapPolyline(apiKey: "AIzaSyAL8bPKcw2oua6nTG7aZMiQEedmePscNl0");

  getSomePoints() async {
    var permissions =
        await Permission.getPermissionsStatus([PermissionName.Location]);
    if (permissions[0].permissionStatus == PermissionStatus.notAgain) {
      print("permission yok");
      var askpermissions =
          await Permission.requestPermissions([PermissionName.Location]);
    } else {
      print("permission var");
      routeCoordinates = await googleMapPolyline.getCoordinatesWithLocation(
          origin: LatLng(39.8748896, 32.7615573),
          destination: LatLng(39.8713623, 32.7641787),
          mode: RouteMode.driving);
    }
  }

  @override
  void initState() {
    super.initState();
    getSomePoints();
  }

  static final CameraPosition _ctisBuilding = CameraPosition(
    bearing: 180,
    target: LatLng(39.8713623, 32.7641787),
    //tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
      polylines.add(Polyline(
          polylineId: PolylineId('route1'),
          visible: true,
          points: routeCoordinates,
          width: 4,
          color: Colors.blue,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              height: 150,
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
            height: 450,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _ctisBuilding,
              onMapCreated: onMapCreated,
              polylines: polylines,
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
                  margin: EdgeInsets.only(top: 40),
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
              Container(
                margin: EdgeInsets.only(top: 40),
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
