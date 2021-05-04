import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/signIn/sign_in_screen.dart';

class VerifyScreen extends StatefulWidget {
  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User user;
  Timer timer;
  @override
  void initState() {
    user = auth.currentUser;
    user.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 150),
            height: 130,
            width: 300,
            child: Image.asset("assets/images/NeYesek_banner.png"),
          ),
          Center(
            child: Container(
                height: 150,
                width: 300,
                margin: EdgeInsets.only(top: 100, left: 10),
                child: Text(
                    "Doğrulama maili ${user.email} adlı adresinize gönderildi. Lüften e-mail adresinizi doğrulayınız ve giriş sayfasına yönlendirilmeyi bekleyiniz.",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
          )
        ],
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    user = auth.currentUser;
    await user.reload();
    if (user.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignInScreen()));
    }
  }
}
