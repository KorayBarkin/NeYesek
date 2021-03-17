import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/phoneLogin/phone_login_screen.dart';
import 'package:food_ui_kit/screens/signIn/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_ui_kit/screens/signUp/components/verify.dart';
import 'package:food_ui_kit/screens/database/customer.dart';
import 'package:food_ui_kit/screens/database/database.dart';
import 'package:food_ui_kit/screens/database/product.dart';
import 'package:food_ui_kit/screens/database/restaurant.dart';
import 'package:food_ui_kit/screens/database/reservation.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/buttons/primary_button.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _obscureText = true;

  FocusNode _emaildNode;
  FocusNode _passwordNode;
  FocusNode _conformPasswordNode;

  String _fullName, _email, _password, _conformPassword;
  final auth = FirebaseAuth.instance;
  List<Customer> customers = [];
  List<Product> products = [];
  List<Restaurant> restaurants = [];
  List<Reservation> reservations = [];

  void newCustomer(String fullName, String email) {
    var customer = new Customer(fullName, email);
    customer.setId(createCustomer(customer));
    this.setState(() {
      customers.add(customer);
    });
  }

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
    this.setState(() {
      products.add(product);
    });
  }

  void newRestaurant(String name, String email, String description,
      String address, String phoneNumber, double rating, String image) {
    var restaurant = new Restaurant(
        name, email, description, address, phoneNumber, rating, image);
    restaurant.setId(createRestaurant(restaurant));
    this.setState(() {
      restaurants.add(restaurant);
    });
  }

  void newReservation(String customerName, String restaurantName, String date,
      String reservationDetail, bool status) {
    var reservation = new Reservation(
        customerName, restaurantName, date, reservationDetail, status);
    reservation.setId(createReservation(reservation));
    this.setState(() {
      reservations.add(reservation);
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordNode = FocusNode();
    _emaildNode = FocusNode();
    _conformPasswordNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordNode.dispose();
    _emaildNode.dispose();
    _conformPasswordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name Field
          TextFormField(
            autovalidate: _autoValidate,
            validator: requiredValidator,
            onSaved: (value) => _fullName = value,
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              // Once user click on Next then it go to email field
              _emaildNode.requestFocus();
            },
            style: kSecondaryBodyTextStyle,
            cursorColor: kActiveColor,
            decoration: InputDecoration(
              hintText: "İsim soyisim",
              contentPadding: kTextFieldPadding,
            ),
          ),
          VerticalSpacing(),

          // Email Field
          TextFormField(
            focusNode: _emaildNode,
            autovalidate: _autoValidate,
            validator: emailValidator,
            onSaved: (value) => _email = value,
            textInputAction: TextInputAction.next,
            onEditingComplete: () {
              // Once user click on Next then it go to password field
              _passwordNode.requestFocus();
            },
            style: kSecondaryBodyTextStyle,
            cursorColor: kActiveColor,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email adresi",
              contentPadding: kTextFieldPadding,
            ),
          ),
          VerticalSpacing(),

          // Password Field
          TextFormField(
            focusNode: _passwordNode,
            obscureText: _obscureText,
            autovalidate: _autoValidate,
            validator: passwordValidator,
            textInputAction: TextInputAction.next,
            onEditingComplete: () => _conformPasswordNode.requestFocus(),
            // We need to validate our password
            onChanged: (value) => _password = value,
            onSaved: (value) => _password = value,
            style: kSecondaryBodyTextStyle,
            cursorColor: kActiveColor,
            decoration: InputDecoration(
              hintText: "Parola",
              contentPadding: kTextFieldPadding,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: kBodyTextColor)
                    : const Icon(Icons.visibility, color: kBodyTextColor),
              ),
            ),
          ),
          VerticalSpacing(),

          // Confirm Password Field
          TextFormField(
            focusNode: _conformPasswordNode,
            obscureText: _obscureText,
            autovalidate: _autoValidate,
            validator: (value) =>
                matchValidator.validateMatch(value, _password),
            onSaved: (value) => _conformPassword = value,
            style: kSecondaryBodyTextStyle,
            cursorColor: kActiveColor,
            decoration: InputDecoration(
              hintText: "Parolanızı onaylayın",
              contentPadding: kTextFieldPadding,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: _obscureText
                    ? const Icon(Icons.visibility_off, color: kBodyTextColor)
                    : const Icon(Icons.visibility, color: kBodyTextColor),
              ),
            ),
          ),
          VerticalSpacing(),
          // Sign Up Button
          PrimaryButton(
            text: "Kayıt ol",
            press: () async {
              if (_formKey.currentState.validate()) {
                // If all data are correct then save data to out variables
                _formKey.currentState.save();
                /*auth
                    .createUserWithEmailAndPassword(
                        email: _email, password: _password)
                    .then((_) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignInScreen()));
                });
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PghoneLoginScreen(),
                  ),
                );*/*/
                try {
                  await auth.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  print(
                      "Signed up is done and now you can verify the email address.");
                  newCustomer(_fullName, _email);
                  newProduct("Kavurma", "Yıldız", "Yağsız Dana Eti",
                      "Muhteşem!", "Sulu Yemek", 10, 35, "kavurma.png");
                  newRestaurant(
                      "CTIS Burger",
                      "ctisburger@gmail.com",
                      "Bilkentin en lezzetli burgerleri.",
                      "Bilkent Üniversitesi",
                      "05553332211",
                      9.6,
                      "assets/images/medium_3.png");
                  newReservation("Berat Özyildiz", "Yıldız Lokantası",
                      "24/02/2021", "2 kişilik masa", true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VerifyScreen()));
                } catch (e) {
                  print("E-mail is already taken");
                  _showDialog();
                }
              } else {
                // If all data are not valid then start auto validation.
                setState(() {
                  _autoValidate = true;
                });
              }
            },
          ),
        ],
      ),
    );
  }

  _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text("E-Posta çoktan alınmış."),
          content: Text("Lütfen tekrar deneyiniz."),
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
}
