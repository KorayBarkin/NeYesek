import 'package:flutter/material.dart';

import 'components/body.dart';

class takeReservationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rezervasyonlar"),
      ),
      body: Body(),
    );
  }
}
