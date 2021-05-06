import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DisplayMenuScreen extends StatefulWidget {
  @override
  _DisplayMenuScreenState createState() => _DisplayMenuScreenState();
}

class _DisplayMenuScreenState extends State<DisplayMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Center(
          child: Container(
            height: 130,
            width: 300,
            child: Image.asset("assets/images/NeYesek_banner.png"),
          ),
        ),
        StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('products').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Text("Loading... Please wait.");
              else {
                return Column(
                  children: <Widget>[Text(snapshot.data.docs[0]['name'])],
                );
              }
            })
      ],
    ));
  }
}
