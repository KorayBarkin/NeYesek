import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final menuRef = FirebaseFirestore.instance.collection('products');

class MenuDisplayScreen extends StatefulWidget {
  @override
  _MenuDisplayScreenState createState() => _MenuDisplayScreenState();
}

class _MenuDisplayScreenState extends State<MenuDisplayScreen> {
  @override
  void initState() {
    getMenu();
    super.initState();
  }

  getMenu() {
    menuRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        print(doc.data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
