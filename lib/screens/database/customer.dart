import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Customer {
  String email;
  String fullName;
  DatabaseReference _id;
  Customer(this.fullName, this.email);

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {'fullName': this.fullName, 'email': this.email};
  }
}
