import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './components/google_sign_in.dart';
import 'components/body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home/home_screen.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Giriş Yapınız"),
        ),
        body: ChangeNotifierProvider(
            create: (context) => GoogleSignInProvider(),
            child: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  final provider = Provider.of<GoogleSignInProvider>(context);
                  if (provider.isSigningIn) {
                    return buildLodading();
                  } else if (snapshot.hasData) {
                    print("data: ${snapshot.data}");
                    return HomeScreen();
                  } else {
                    return Body();
                  }
                })));
  }

  Widget buildLodading() => Center(child: CircularProgressIndicator());
}
