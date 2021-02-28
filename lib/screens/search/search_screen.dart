import 'package:flutter/material.dart';

import 'components/body.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arama", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Body(),
    );
  }
}
