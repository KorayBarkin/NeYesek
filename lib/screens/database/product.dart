import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Product {
  String name;
  String restaurantName;
  String description;
  String comments;
  String category;
  double rating;
  double price;
  String image;
  DatabaseReference _id;
  Product(this.name, this.restaurantName, this.description, this.comments,
      this.category, this.rating, this.price, this.image);

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'restaurantName': this.restaurantName,
      'description': this.description,
      'comments': this.comments,
      'category': this.category,
      'rating': this.rating,
      'price': this.price,
      'image': this.image
    };
  }
}
