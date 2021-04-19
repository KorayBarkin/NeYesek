import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Reservation {
  String customerName;
  String customerEmail;
  String restaurantName;
  String date;
  String reservationDetail;
  bool status;
  DatabaseReference _id;
  Reservation(this.customerName, this.customerEmail, this.restaurantName,
      this.date, this.reservationDetail, this.status);

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'customerName': this.customerName,
      'customerEmail': this.customerEmail,
      'restaurantName': this.restaurantName,
      'date': this.date,
      'reservationDetail': this.reservationDetail,
      'status': this.status,
    };
  }
}
