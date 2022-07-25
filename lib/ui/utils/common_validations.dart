import 'package:flutter/material.dart';
import 'package:zumi_app/ui/utils/misc_functions.dart';

mixin CommonValidations {
  static const int passwordMinLength = 8;
  static const int otpLength = 6;

  @protected
  String? isValidPassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password cannot be empty";
    } else if (password.length < passwordMinLength) {
      return "Password should be at least $passwordMinLength characters long";
    } else {
      return null;
    }
  }

  @protected
  String? isValidEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty";
    }

    final isValid = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(email.trim());

    if (isValid) {
      return null;
    } else {
      return "Entered Email is not valid";
    }
  }

  @protected
  String? isConfirmPasswordValid(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm Password cannot be empty";
    }
    if (confirmPassword.trim() == password?.trim()) {
      return null;
    } else {
      return "Passwords do not match";
    }
  }

  @protected
  String? isValidName(String? name, String fieldName) {
    const pattern = r'^[a-z A-Z,.\-]+$';
    final regExp = RegExp(pattern);

    if (name == null || name.isEmpty) {
      return "$fieldName cannot be empty";
    }

    if (!regExp.hasMatch(name.trim())) {
      return "Please enter a valid $fieldName";
    } else {
      return null;
    }
  }

  @protected
  String? isNotEmpty(String? value, String? fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName cannot be empty";
    } else {
      return null;
    }
  }

  @protected
  String? isValidPhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Phone Number cannot be empty";
    } else {
      final phoneUnformatted = phone.replaceAll(RegExp("[()-]"), "");
      return phoneUnformatted.length == 10
          ? null
          : "Please Enter a valid phone number containing 10 digits";
    }
  }

  @protected
  String? isValidUrl(String? url) {
    if (url == null || url.isEmpty) return "Url cannot be empty.";
    final parsed = Uri.tryParse(url);
    if (parsed == null || parsed.host.isEmpty) {
      return "Please enter a valid Link";
    } else {
      return null;
    }
  }

  @protected
  String? isValidNumber(String? value, String fieldName) {
    if (value.isNullOrBlank()) return "$fieldName cannot be empty";
    final int? parsed = int.tryParse(value ?? "");
    if (parsed == null) {
      return "Please enter a valid number";
    } else if (parsed < 0) {
      return "$fieldName be less than 0";
    } else {
      return null;
    }
  }

  @protected
  String? isValidOTP(String? otp) {
    if (otp.isNullOrBlank()) return "Please Enter OTP";
    return otp?.trim().length == otpLength ? null : "Please enter a valid OTP";
  }
}

String? Function(String? value) createEmptyValidator(String fieldName) {
  return (String? value) {
    if (value?.isEmpty == true) {
      return "$fieldName cannot be empty";
    } else {
      return null;
    }
  };
}
