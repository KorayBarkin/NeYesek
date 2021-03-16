import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Restaurant {
  String name;
  String email;
  String description;
  String address;
  String phoneNumber;
  double rating;
  String image;
  DatabaseReference _id;
  Restaurant(this.name, this.email, this.description, this.address,
      this.phoneNumber, this.rating, this.image);

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'email': this.email,
      'description': this.description,
      'address': this.address,
      'phoneNumber': this.phoneNumber,
      'rating': this.rating,
      'image': this.image
    };
  }
}
