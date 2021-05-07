import 'package:flutter/material.dart';

import 'components/body.dart';

class CommentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yorumlar Ve Puanlamalar"),
      ),
      body: Body(),
    );
  }
}
