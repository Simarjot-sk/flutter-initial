import 'package:flutter/material.dart';
import 'package:zumi_app/data/repositories/auth_repo.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';
import 'package:zumi_app/ui/utils/common_validations.dart';
import 'package:zumi_app/ui/utils/misc_functions.dart';

class CreateNewPasswordViewModel extends ViewModel with CommonValidations {
  String? newPassword, newPasswordError;
  String? confirmPassword, confirmPasswordError;
  VoidCallback? onPasswordUpdated;

  void createNewPassword() {
    newPasswordError = isValidPassword(newPassword);
    confirmPasswordError = isConfirmPasswordValid(newPassword, confirmPassword);

    final isValid = newPasswordError == null && confirmPasswordError == null;
    notifyListeners();
    if (isValid) {
      callApi(() async {
        final res = await AuthRepo.resendOTP(newPassword.trimNonNull());
        if (res.isSuccessful) {
          onPasswordUpdated?.call();
        } else {
          onError?.call(res.message);
        }
      });
    }
  }
}
