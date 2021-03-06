import 'package:flutter/material.dart';

import 'components/body.dart';

class LocationChange extends StatefulWidget {
  @override
  _LocationChangeState createState() => _LocationChangeState();
}

class _LocationChangeState extends State<LocationChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar();
  }
}
