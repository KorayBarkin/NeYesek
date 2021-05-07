import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './google_sign_in.dart';
import '../../../components/buttons/socal_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/welcome_text.dart';
import '../../../screens/signUp/sign_up_screen.dart';
import 'sign_in_form.dart';
import 'package:provider/provider.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: WelcomeText(
                title: "Hoş geldiniz!",
                text:
                    "Giriş yapmak için email adresinizi \nve parolanızı girin, siz de keşfetmeye başlayın :)",
              ),
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

            // SignInForm contains forget password
            SignInForm(),
            VerticalSpacing(),
            kOrText,
            VerticalSpacing(of: 20),

            // Create new account
            Center(
              child: Text.rich(
                TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(fontWeight: FontWeight.w600),
                  text: "Hesabınız yok mu? ",
                  children: <TextSpan>[
                    TextSpan(
                      text: "Yeni hesap oluştur",
                      style: TextStyle(color: kActiveColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
            VerticalSpacing(),

            // Facebook
            SocalButton(
              press: () {},
              text: "Facebook ile giriş yapın",
              color: Color(0xFF395998),
              icon: SvgPicture.asset(
                'assets/icons/facebook.svg',
                color: Color(0xFF395998),
              ),
            ),
            VerticalSpacing(of: 15),

            // Google
            SocalButton(
              press: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.login();
              },
              text: "Google ile giriş yapın",
              color: Color(0xFF4285F4),
              icon: SvgPicture.asset(
                'assets/icons/google.svg',
              ),
            ),
            VerticalSpacing(),
          ],
        ),
      ),
    );
  }
}
