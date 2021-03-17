import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../runningData.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  Map<MarkerId, Marker> selected = <MarkerId, Marker>{};

  static CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(ChoosenLocation.latitude, ChoosenLocation.longitude),
    //tilt: 59.440717697143555,
    zoom: 14.151926040649414,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomGesturesEnabled: true,
        markers: Set<Marker>.of(selected.values),
        initialCameraPosition: _cameraPosition,
        onTap: (argument) {
          _createMarker(argument);
          SelectedFromMaps = argument;
        },
        onMapCreated: (map) {});
  }

  void _createMarker(LatLng arg) {
    final Marker marker = Marker(
        markerId: MarkerId("Selected Location"),
        position: arg,
        icon:
            BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange));

    setState(() {
      selected[MarkerId("Selected Location")] = marker;
    });
  }
}
