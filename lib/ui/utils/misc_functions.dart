import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

extension NullableStringExtensions on String? {
  String trimNonNull() {
    return this?.trim() ?? "";
  }

  bool isNullOrBlank() {
    final isEmpty = this?.trim().isEmpty ?? true;
    return this == null || isEmpty;
  }
}

extension WidgetListExtensions on List<Widget> {
  List<Widget> withSpacing({double? height, double? width}) {
    final listOfLists = map((e) => [
          e,
          SizedBox(
            width: width,
            height: height,
          )
        ]);
    return listOfLists.expand((element) => element).toList(growable: false);
  }
}

///concatenates country code with phone number and removes "+" from the country code
String getCompletePhoneNumber(String countryCode, String phone) {
  final countryCodeWithoutPlus = countryCode.replaceAll("+", "").trim();
  return "$countryCodeWithoutPlus$phone";
}

void closeApplication() {
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
}

///navigates to the correct home screen based on the user type
void navigateToHome(BuildContext context, [bool clearBackstack = true]) {
  String route = "";
  if (clearBackstack) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      (final route) => false,
    );
  } else {
    Navigator.pushNamed(
      context,
      route,
    );
  }
}
