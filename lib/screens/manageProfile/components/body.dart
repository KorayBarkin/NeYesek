import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ui_kit/constants.dart';
import 'package:food_ui_kit/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_ui_kit/screens/signUp/components/verify.dart';
import 'package:flutter/material.dart';
import 'package:food_ui_kit/components/bottom_nav_bar.dart';
import 'package:food_ui_kit/screens/findRestaurants/find_restaurants_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../signIn/components/google_sign_in.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../screens/forgotPassword/forgot_password_screen.dart';

class Body extends StatelessWidget {
  @override
  bool _autoValidate = false;
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();
    _showDialog1() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(
                "E-Mail adresinize şifre yenileme bağlantısı gönderilmiştir."),
            content: Text("Lütfen e-mail adresinizi kontrol ediniz."),
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

    _emailDialog() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text(
                "E-Mail adresiniz değiştrildi ve değişiklik e-mail adresinize gönderildi."),
            content: Text("Lütfen e-mail adresinizi kontrol ediniz."),
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

    Future<void> _displayTextInputDialog(BuildContext context) async {
      String _email;
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Yeni E-mail Adresi Giriniz.'),
              content: TextFormField(
                autovalidate: _autoValidate,
                validator: emailValidator,
                onChanged: (value) => _email = value,
                controller: _textFieldController,
                decoration: InputDecoration(hintText: "E-mail Adresi"),
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: MaterialButton(
                    shape: StadiumBorder(),
                    minWidth: 100,
                    color: kActiveColor,
                    child: new Text("Güncelle"),
                    onPressed: () {
                      FirebaseAuth.instance.currentUser.updateEmail(_email);
                      Navigator.of(context).pop();
                      _emailDialog();
                    },
                  ),
                ),
              ],
            );
          });
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(),
              Text("Profil Ayarları", style: kH2TextStyle),
              Text(
                "Profil ayarlarınızı güncelleyiniz.",
                style: kBodyTextStyle,
              ),
              VerticalSpacing(of: 10),
              ProfileMenuCard(
                svgSrc: "assets/icons/lock.svg",
                title: "Parola",
                subTitle: "Parolanızı değiştirin.",
                press: () {
                  FirebaseAuth.instance.sendPasswordResetEmail(
                      email: FirebaseAuth.instance.currentUser.email);
                  _showDialog1();
                },
              ),
              ProfileMenuCard(
                svgSrc: "assets/icons/email.svg",
                title: "E-mail",
                subTitle: "E-mail adresinizi değiştirin.",
                press: () {
                  _displayTextInputDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    Key key,
    this.title,
    this.subTitle,
    this.svgSrc,
    this.press,
  }) : super(key: key);

  final String title, subTitle, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              SvgPicture.asset(
                svgSrc,
                height: 24,
                width: 24,
                color: kMainColor.withOpacity(0.64),
              ),
              HorizontalSpacing(of: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      style: kSecondaryBodyTextStyle,
                    ),
                    VerticalSpacing(of: 5),
                    Text(
                      subTitle,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        color: kMainColor.withOpacity(0.54),
                      ),
                    ),
                  ],
                ),
              ),
              HorizontalSpacing(of: 10),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SystemPadding extends StatelessWidget {
  final Widget child;

  _SystemPadding({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return new AnimatedContainer(
        padding: mediaQuery.viewInsets,
        duration: const Duration(milliseconds: 300),
        child: child);
  }
}
