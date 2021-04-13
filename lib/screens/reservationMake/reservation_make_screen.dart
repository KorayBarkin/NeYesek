import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/database/database.dart';
import 'package:food_ui_kit/screens/database/product.dart';
import 'package:food_ui_kit/screens/database/restaurant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class ReservationMakeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  void newProduct(
      String name,
      String restaurantName,
      String description,
      String comments,
      String category,
      double rating,
      double price,
      String image) {
    var product = new Product(name, restaurantName, description, comments,
        category, rating, price, image);
    product.setId(createProduct(product));
    products.add(product);
  }

  List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    Future<void> _displayTextInputDialog(BuildContext context) async {
      String _email, _name, _category, _description, _priceDummy;
      final format = DateFormat("yyyy-MM-dd HH:mm");
      double price;
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.all(10),
              title: Center(child: Text('Rezervasyon Yap')),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                height: 350,
                width: 700,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("Restoran adı"),
                      TextFormField(
                        //autovalidate: _autoValidate,
                        //validator: ,
                        onChanged: (value) => _name = value,
                        //controller: ,
                        decoration:
                            InputDecoration(hintText: "Restoran adını giriniz."),
                      ),
                      Text("Açıklama"),
                      TextFormField(
                        //autovalidate: _autoValidate,
                        //validator: ,
                        onChanged: (value) => _description = value,
                        //controller: ,
                        decoration:
                            InputDecoration(hintText: "Kaç kişi olacaksınız vb."),
                      ),
                      
                     Text('Tarih (${format.pattern})'),
                      DateTimeField(
                        format: format,
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: 100,
                    color: Colors.orange[400],
                    child:
                        new Text("Ekle", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      FirebaseDatabase.instance
                          .reference()
                          .child("restaurants/")
                          .once()
                          .then((DataSnapshot dataSnapshot) {
                        var keys = dataSnapshot.value.keys;
                        var values = dataSnapshot.value;
                        for (var key in keys) {
                          if (values[key]['email'] == auth.currentUser.email) {
                            newProduct(
                                _name,
                                values[key]['name'],
                                _description,
                                null,
                                _category,
                                null,
                                double.parse(_priceDummy),
                                null);
                          }
                        }
                      });

                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            );
          });
    }
    

    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Spacer(),
          Center(
            child: Container(
              height: 130,
              width: 300,
              child: Image.asset("assets/images/NeYesek_banner.png"),
            ),
          ),
          Spacer(),
          Container(
              child: Center(
            child: Text("Bilkent Pizza",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.orange[400])),
          )),
          Spacer(),
          Center(
            child: GestureDetector(
              onTapDown: (c) {
                _displayTextInputDialog(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 70,
                width: 220,
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
                    'Rezervasyon Yap',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Center(
            child: GestureDetector(
              onTapDown: (c) {
                //CODE HERE
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 70,
                width: 220,
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
                    'Rezervasyonlarım',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ]));
  }
}
