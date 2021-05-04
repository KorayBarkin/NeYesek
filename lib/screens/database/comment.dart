import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Comment {
  String evaluator;
  String comment;
  int rating;
  DatabaseReference _id;
  Comment(this.evaluator, this.comment, this.rating);

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'evaluator': this.evaluator,
      'comment': this.comment,
      'rating': this.rating
    };
  }
}
