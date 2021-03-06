import 'package:flutter/material.dart';

import 'package:location/location.dart';

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

LocationData _CurrentPosition = null;

class _CurrentLocationState extends State<CurrentLocation> {
  String _useraddress = "Address not found";

  Future<void> _updateLocationName() async {
    //_getAddress(_currentPosition.latitude, _currentPosition.longitude);
    setState(() {
      _useraddress = "bilkent loc ";
    });
  }

  _getUserLocation() async {
    _CurrentPosition = await Location().getLocation();
    print(_CurrentPosition.latitude);
    print(_CurrentPosition.longitude);

    _updateLocationName();
  }

  @override
  void initState() {
    super.initState();
    if (_CurrentPosition == null) {
      _getUserLocation();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(_useraddress);
  }
}
