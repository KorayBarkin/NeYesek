import 'package:flutter/material.dart';
import 'package:food_ui_kit/size_config.dart';
import 'package:form_field_validator/form_field_validator.dart';

// clolors that we use in our app
const kMainColor = Color(0xFF010F07);
const kActiveColor = Color(0xFF22A45D);
const kAccentColor = Color(0xFFEF9920);
const kBodyTextColor = Color(0xFF868686);
const kInputColor = Color(0xFFFBFBFB);
const kBgColor = Colors.white;

// Text Styles
final TextStyle kH1TextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(34),
  fontWeight: FontWeight.w500,
  letterSpacing: 0.22,
);

final TextStyle kH2TextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.w600,
  letterSpacing: 0.18,
);

final TextStyle kH3TextStyle = kH2TextStyle.copyWith(
  fontSize: getProportionateScreenWidth(20),
  letterSpacing: 0.14,
);

final TextStyle kHeadlineTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(30),
  fontWeight: FontWeight.bold,
);

final TextStyle kSubHeadTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.w500,
  color: kMainColor,
  letterSpacing: 0.44,
);

final TextStyle kBodyTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(16),
  color: kBodyTextColor,
  height: 1.5,
);

final TextStyle kSecondaryBodyTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(14),
  fontWeight: FontWeight.w500,
  color: kMainColor,
  // height: 1.5,
);

final TextStyle kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: getProportionateScreenWidth(14),
  fontWeight: FontWeight.bold,
);

final TextStyle kCaptionTextStyle = TextStyle(
  color: kMainColor.withOpacity(0.64),
  fontSize: getProportionateScreenWidth(12),
  fontWeight: FontWeight.w600,
);

// padding
const double kDefaultPadding = 20.0;
final EdgeInsets kTextFieldPadding = EdgeInsets.symmetric(
  horizontal: kDefaultPadding,
  vertical: getProportionateScreenHeight(kDefaultPadding),
);

// Default Animation Duration
const Duration kDefaultDuration = Duration(milliseconds: 250);

// Text Field Decoration
const OutlineInputBorder kDefaultOutlineInputBorder = OutlineInputBorder(
  borderRadius: const BorderRadius.all(Radius.circular(6)),
  borderSide: const BorderSide(
    color: Color(0xFFF3F2F2),
  ),
);

const InputDecoration otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.zero,
  counterText: "",
  errorStyle: TextStyle(height: 0),
);

const kErrorBorderSide = BorderSide(color: Colors.red, width: 1);

// Validator
final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Parola girmeniz zorunludur.'),
  MinLengthValidator(8,
      errorText: 'Parolanız en az 8 karakter uzunluğunda olmalıdır.'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-/])',
      errorText: 'Parolanız en az bir özel karakter içermelidir.')
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email adresi girmeniz zorunludur.'),
  EmailValidator(errorText: 'Geçerli bir email adresi giriniz.')
]);

final requiredValidator = RequiredValidator(errorText: 'Bu alan zorunludur.');
final matchValidator = MatchValidator(errorText: 'şifreler eşleşmiyor.');

final phoneNumberValidator = MinLengthValidator(10,
    errorText: 'Telefon numarası 10 karakter olmalıdır. (Örn: 5061234567');

// Common Text
final Center kOrText = Center(
    child: Text("ve ya", style: TextStyle(color: kMainColor.withOpacity(0.7))));
