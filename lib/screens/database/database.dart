import 'package:firebase_database/firebase_database.dart';
import 'customer.dart';
import 'product.dart';
import 'restaurant.dart';
import 'reservation.dart';
import 'comment.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference createCustomer(Customer customer) {
  var id = databaseReference.child('customers/').push();
  id.set(customer.toJson());
  return id;
}

DatabaseReference createProduct(Product product) {
  var id = databaseReference.child('products/').push();
  id.set(product.toJson());
  return id;
}

DatabaseReference createRestaurant(Restaurant restaurant) {
  var id = databaseReference.child('restaurants/').push();
  id.set(restaurant.toJson());
  return id;
}

DatabaseReference createReservation(Reservation reservation) {
  var id = databaseReference.child('reservations/').push();
  id.set(reservation.toJson());
  return id;
}

DatabaseReference createComment(Comment comment, String Pid) {
  var id = databaseReference.child('products/' + Pid + '/comments/').push();
  id.set(comment.toJson());
  return id;
}
