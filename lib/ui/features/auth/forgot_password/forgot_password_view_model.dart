import 'package:flutter/material.dart';
import 'package:zumi_app/data/repositories/auth_repo.dart';
import 'package:zumi_app/ui/utils/app_constants.dart';
import 'package:zumi_app/ui/utils/common_validations.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';
import 'package:zumi_app/ui/utils/misc_functions.dart';

class ForgotPasswordViewModel extends ViewModel with CommonValidations {
  String? phone, phoneError;
  String countryCode = defaultCountryCode;
  VoidCallback? onOtpSent;

  ///Validates mobile number entered by user
  ///calls REST endpoint to request otp if account associated with mobile number is found
  Future<void> requestOTP() async {
    if (isLoading) return;

    phoneError = isValidPhoneNumber(phone);
    notifyListeners();
    final isValid = phoneError == null;

    if (isValid) {
      callApi(() async {
        final completePhoneNumber = getCompletePhoneNumber(
          countryCode,
          phone.trimNonNull(),
        );
        final response = await AuthRepo.resendOTP(
          completePhoneNumber,
        );
        if (response.isSuccessful) {
          onOtpSent?.call();
        } else {
          onError?.call(response.message);
        }
      });
    }
  }
}
