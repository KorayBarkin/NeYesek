import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../components/welcome_text.dart';
import '../../../screens/signIn/sign_in_screen.dart';
import '../../../size_config.dart';
import '../../../components/buttons/socal_button.dart';
import 'sign_up_form.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(
                title: "Hesap Oluştur",
                text:
                    "Kayıt olmak için adınızı, email adresinizi \nve parolanızı giriniz.",
              ),
              LiteRollingSwitch(
                //initial value
                value: true,
                textOn: 'Kullanıcı',
                textOff: 'Restoran',
                colorOn: Colors.greenAccent[700],
                colorOff: Colors.redAccent[700],
                iconOn: Icons.person,
                iconOff: Icons.fastfood_rounded,
                textSize: 15.0,
                onChanged: (bool state) {
                  //Use it to manage the different states
                  print('Current State of SWITCH IS: $state');
                },
              ),
              VerticalSpacing(),
              // Sign Up Form
              SignUpForm(),
              VerticalSpacing(of: 20),

              // Already have account
              Center(
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontWeight: FontWeight.w500),
                    text: "Zaten hesabın var mı?",
                    children: <TextSpan>[
                      TextSpan(
                        text: "Giriş Yap",
                        style: TextStyle(color: kActiveColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignInScreen(),
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpacing(of: 20),
              Center(
                child: Text(
                  "Kayıt olarak gizlilik kurallarımızı\nkabul etmiş sayılırsınız.",
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                ),
              ),
              VerticalSpacing(of: 15),
              kOrText,
              VerticalSpacing(of: 15),

              // Facebook
              SocalButton(
                press: () {},
                text: "Facebook ile giriş yap",
                color: Color(0xFF395998),
                icon: SvgPicture.asset(
                  'assets/icons/facebook.svg',
                  color: Color(0xFF395998),
                ),
              ),
              VerticalSpacing(of: 15),

              // Google
              SocalButton(
                press: () {},
                text: "Google ile giriş yap",
                color: Color(0xFF4285F4),
                icon: SvgPicture.asset(
                  'assets/icons/google.svg',
                ),
              ),
              VerticalSpacing(),
            ],
          ),
        ),
      ),
    );
  }
}
