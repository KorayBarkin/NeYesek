import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../components/welcome_text.dart';
import '../../size_config.dart';
import 'components/otp_form.dart';

class NumberVerifyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ne Yesek'e katıl!"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeText(
                title: "Telefon numaranınızı doğrulayınız",
                text:
                    "Telefonunuza gönderilen 4 haneli kodu giriniz. Gönderilen numara: \n+905061234567",
              ),

              // OTP form
              OtpForm(),
              VerticalSpacing(),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Kodunuz gelmedi mi? ",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(fontWeight: FontWeight.w500),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Tekrar gönder",
                        style: TextStyle(color: kActiveColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Your OTP PIN resend code
                          },
                      ),
                    ],
                  ),
                ),
              ),
              VerticalSpacing(),
              Center(
                child: Text(
                  "Uygulamaya kayıt olarak gizlilik koşullarımızı \nkabul etmiş sayılırsınız.",
                  textAlign: TextAlign.center,
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
