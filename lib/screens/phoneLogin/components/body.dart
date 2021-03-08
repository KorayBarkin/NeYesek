import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:food_ui_kit/screens/phoneLogin/number_verify_screen.dart';

import '../../../constants.dart';
import '../../../components/welcome_text.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _phoneNumber;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeText(
              title: "Sen de katıl!",
              text:
                  "Telefon numaranı gir ve \nen iyi yemekleri, restoranları keşfet :)",
            ),
            VerticalSpacing(),
            Form(
              key: _formKey,
              child: TextFormField(
                autovalidate: _autoValidate,
                validator: phoneNumberValidator,
                autofocus: true,
                onSaved: (value) => _phoneNumber = value,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: kMainColor),
                cursorColor: kActiveColor,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Telefon numarası",
                  contentPadding: kTextFieldPadding,
                  prefix: SizedBox(
                    height: 20,
                    // For more check https://pub.dev/packages/country_code_picker
                    child: CountryCodePicker(
                      onChanged: (countryCode) => {
                        // Save your country code
                      },
                      padding: const EdgeInsets.only(right: 5),
                      textStyle: TextStyle(color: kMainColor),
                      initialSelection: "TR",
                      showCountryOnly: false,
                      searchDecoration:
                          InputDecoration(contentPadding: EdgeInsets.zero),
                    ),
                  ),
                ),
              ),
            ),
            Spacer(),
            // Sign Up Button
            PrimaryButton(
              text: "Kayıt Ol",
              press: () {
                if (_formKey.currentState.validate()) {
                  // If all data are correct then save data to out variables
                  _formKey.currentState.save();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NumberVerifyScreen(),
                    ),
                  );
                } else {
                  // If all data are not valid then start auto validation.
                  setState(() {
                    _autoValidate = true;
                  });
                }
              },
            ),
            VerticalSpacing(),
          ],
        ),
      ),
    );
  }
}
