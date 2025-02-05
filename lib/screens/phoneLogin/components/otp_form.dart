import 'package:flutter/material.dart';
import 'package:food_ui_kit/components/bottom_nav_bar.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/buttons/primary_button.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  FocusNode _pin1Node;
  FocusNode _pin2Node;
  FocusNode _pin3Node;
  FocusNode _pin4Node;

  @override
  void initState() {
    super.initState();
    _pin1Node = FocusNode();
    _pin2Node = FocusNode();
    _pin3Node = FocusNode();
    _pin4Node = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    _pin1Node.dispose();
    _pin2Node.dispose();
    _pin3Node.dispose();
    _pin4Node.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenWidth(50),
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) _pin2Node.requestFocus();
                  },
                  autovalidate: _autoValidate,
                  validator: RequiredValidator(errorText: ''),
                  autofocus: true,
                  maxLength: 1,
                  focusNode: _pin1Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenWidth(50),
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) _pin3Node.requestFocus();
                  },
                  validator: RequiredValidator(errorText: ''),
                  autovalidate: _autoValidate,
                  maxLength: 1,
                  focusNode: _pin2Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenWidth(50),
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) _pin4Node.requestFocus();
                  },
                  validator: RequiredValidator(errorText: ''),
                  autovalidate: _autoValidate,
                  maxLength: 1,
                  focusNode: _pin3Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenWidth(50),
                child: TextFormField(
                  onChanged: (value) {
                    if (value.length == 1) _pin4Node.unfocus();
                  },
                  validator: RequiredValidator(errorText: ''),
                  autovalidate: _autoValidate,
                  maxLength: 1,
                  focusNode: _pin4Node,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                ),
              ),
            ],
          ),
          VerticalSpacing(of: 40),
          // Continue Button
          PrimaryButton(
            text: "Devam",
            press: () {
              if (_formKey.currentState.validate()) {
                // If all data are correct then save data to out variables
                _formKey.currentState.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBar(),
                  ),
                );
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
}
