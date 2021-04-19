import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/database/database.dart';
import 'package:food_ui_kit/screens/database/product.dart';
import 'package:food_ui_kit/screens/database/restaurant.dart';
import 'package:food_ui_kit/screens/database/reservation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../../../constants.dart';
import '../../orderDetails/order_details_screen.dart';

class Body extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance;
  void newReservation(String customerName, String restaurantName, String date,
      String reservationDetail, bool status) {
    var reservation = new Reservation(
        customerName, restaurantName, date, reservationDetail, status);
    reservation.setId(createReservation(reservation));
    reservations.add(reservation);
  }

  List<Reservation> reservations = [];
  @override
  Widget build(BuildContext context) {
    Future<void> _displayTextInputDialog(BuildContext context) async {
      _successDialog() {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text("Rezervasyon Başarılı"),
              content: Text(
                  "Rezervasyon isteğiniz başarıyla restorana iletilmiştir"),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: 100,
                    color: kActiveColor,
                    child: new Text("Kapat"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            );
          },
        );
      }

      _unsuccessDialog() {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text("Lütfen Tekrar Deneyiniz."),
              content:
                  Text("Girilen restoran ismine uygun restoran bulunamadı."),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: 100,
                    color: kActiveColor,
                    child: new Text("Kapat"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            );
          },
        );
      }

      String _customerName, _restaurantName, _reservationDetail;
      DateTime selectedDate;
      final format = DateFormat("yyyy-MM-dd HH:mm");
      database
          .reference()
          .child("customers/")
          .once()
          .then((DataSnapshot dataSnapshot) {
        var keys = dataSnapshot.value.keys;
        var values = dataSnapshot.value;
        for (var key in keys) {
          if (values[key]['email'] == auth.currentUser.email) {
            _customerName = values[key]['fullName'];
            print(_customerName);
          }
        }
      });
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
                        onChanged: (value) => _restaurantName = value,
                        //controller: ,
                        decoration: InputDecoration(
                            hintText: "Restoran adını giriniz."),
                      ),
                      Text("Açıklama"),
                      TextFormField(
                        //autovalidate: _autoValidate,
                        //validator: ,
                        onChanged: (value) => _reservationDetail = value,
                        //controller: ,
                        decoration: InputDecoration(
                            hintText: "Kaç kişi olacaksınız vb."),
                      ),
                      Text('Tarih'),
                      DateTimeField(
                        format: format,
                        onChanged: (value) => selectedDate = value,
                        onShowPicker: (context, currentValue) async {
                          final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(
                                  currentValue ?? DateTime.now()),
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
                    child: new Text("Rezervasyon Yap",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      String _convertedDatetime =
                          "${selectedDate.year.toString()}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')} ${selectedDate.hour.toString()}-${selectedDate.minute.toString()}";
                      database
                          .reference()
                          .child("restaurants/")
                          .once()
                          .then((DataSnapshot dataSnapshot) {
                        var keys = dataSnapshot.value.keys;
                        var values = dataSnapshot.value;
                        for (var key in keys) {
                          if (values[key]['name'] == _restaurantName) {
                            newReservation(_customerName, _restaurantName,
                                _convertedDatetime, _reservationDetail, false);
                            _successDialog();
                          } else {
                            _unsuccessDialog();
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsScreen(),
                  ),
                );
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
