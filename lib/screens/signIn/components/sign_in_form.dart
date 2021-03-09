import 'package:flutter/material.dart';
import 'package:food_ui_kit/components/bottom_nav_bar.dart';
import 'package:food_ui_kit/screens/findRestaurants/find_restaurants_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../screens/forgotPassword/forgot_password_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key key,
  }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool _obscureText = true;

  FocusNode _passwordNode;

  @override
  void initState() {
    super.initState();
    _passwordNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _email, _password;
    final auth = FirebaseAuth.instance;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
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
              hintText: "E-mail adresi",
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

          // Forget Password
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForgotPasswordScreen(),
              ),
            ),
            child: Text(
              "Şifrenizi mi unuttunuz?",
              style: Theme.of(context)
                  .textTheme
                  .caption
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          VerticalSpacing(),

          // Sign In Button
          PrimaryButton(
            text: "Giriş Yap",
            press: () async {
              if (_formKey.currentState.validate()) {
                // If all data are correct then save data to out variables
                _formKey.currentState.save();
                try {
                  await auth.signInWithEmailAndPassword(
                      email: _email, password: _password);
                  print("Signed in, you may want to navigate now");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BottomNavBar()));
                } catch (e) {
                  print("User not found");
                  _showDialog();
                }
              } else {
                // If all data are not valid then start auto validation.
                setState(() {
                  _autoValidate = true;
                });
              }
            },
          )
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
          title: Text("Girdiğiniz e-posta adresi veya şifre yanlış."),
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
