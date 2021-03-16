import 'package:flutter/material.dart';
import 'package:food_ui_kit/components/welcome_text.dart';
import 'package:food_ui_kit/screens/forgotPassword/reset_email_sent_screen.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/buttons/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeText(
              title: "Parola Sıfırlama",
              text:
                  "Lütfen email adresinizi giriniz, girdiğiniz adrese sıfırlama bilgileri gönderilecektir."),
          VerticalSpacing(),
          ForgotPassForm(),
        ],
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({
    Key key,
  }) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Email Field
          TextFormField(
            autovalidate: _autoValidate,
            validator: emailValidator,
            onSaved: (value) => _email = value,
            style: kSecondaryBodyTextStyle,
            cursorColor: kActiveColor,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "Email adresi",
              contentPadding: kTextFieldPadding,
            ),
          ),
          VerticalSpacing(),

          // Reset password Button
          PrimaryButton(
            text: "Parola sıfırla",
            press: () async {
              if (_formKey.currentState.validate()) {
                // If all data are correct then save data to out variables
                _formKey.currentState.save();
                try {
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _email);
                  print("Signed in, you may want to navigate now");

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetEmailSentScreen(),
                      ));
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
