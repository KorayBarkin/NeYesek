import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'comment.dart';

class Product {
  String name;
  String restaurantName;
  String description;
  List<Comment> comments;
  String category;
  double price;
  String image;
  DatabaseReference _id;
  Product(this.name, this.restaurantName, this.description, this.comments,
      this.category, this.price, this.image);

  void setId(DatabaseReference id) {
    this._id = id;
  }

  void addComment(Comment comment) {
    this.comments.add(comment);
  }

  double ratingOverall(List<Comment> comments) {
    double ratingO;
    double ratingTotal;
    for (int i = 0; i < comments.length; i++) {
      ratingO += comments[i].rating;
    }
    ratingTotal = ratingO / comments.length;
    return ratingTotal;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'restaurantName': this.restaurantName,
      'description': this.description,
      'comments': this.comments,
      'category': this.category,
      'price': this.price,
      'image': this.image
    };
  }
}
