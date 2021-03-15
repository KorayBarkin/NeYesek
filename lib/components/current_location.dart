import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;

import '../runningData.dart';

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

String err;
LocationData _CurrentPosition = null;

class _CurrentLocationState extends State<CurrentLocation> {
  String _useraddress = "Address not found";

  Future<void> _updateLocationName() async {
    //_getAddress(_currentPosition.latitude, _currentPosition.longitude);
    List<geo.Placemark> address = await geo.placemarkFromCoordinates(
        _CurrentPosition.latitude, _CurrentPosition.longitude);

    //print(address);
    var toprint = address[0].thoroughfare +
        ", " +
        address[0].subLocality +
        ", " +
        address[0].subAdministrativeArea;

    setState(() {
      _useraddress = toprint;
    });
  }

  _getUserLocation() async {
    _CurrentPosition = await Location().getLocation();
    try {
      _CurrentPosition = await Location().getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        err = 'please grant permission';
        print(err);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        err = 'permission denied- please enable it from app settings';
        print(err);
      }
      _CurrentPosition = null;
    }

    ChoosenLocation =
        LatLng(_CurrentPosition.latitude, _CurrentPosition.longitude);
    StartingLocation = ChoosenLocation;

    // print(_CurrentPosition.latitude);
    // print(_CurrentPosition.longitude);

    _updateLocationName();
  }

  @override
  void initState() {
    super.initState();
    if (ChoosenLocation == null) {
      _getUserLocation();
    } else if (ChoosenLocation ==
        LatLng(_CurrentPosition.latitude, _CurrentPosition.longitude)) {
      _updateLocationName();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(_useraddress);
  }
}
