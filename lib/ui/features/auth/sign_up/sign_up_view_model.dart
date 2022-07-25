import 'package:flutter/material.dart';
import 'package:zumi_app/data/local/shared_pref_helper.dart';
import 'package:zumi_app/data/remote/model/response_dto.dart';
import 'package:zumi_app/data/remote/model/user_dto.dart';
import 'package:zumi_app/data/repositories/auth_repo.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';
import 'package:zumi_app/ui/utils/common_validations.dart';
import 'package:zumi_app/ui/utils/misc_functions.dart';

class SignUpViewModel extends ViewModel with CommonValidations {
  String? name, nameError;
  String? email, emailError;
  String? password, passwordError;
  VoidCallback? onSignUpSuccess;
  bool showPassword = false;

  void signUp() async {
    if (isLoading) return;

    nameError = isValidName(name, 'Name');
    emailError = isValidEmail(email);
    passwordError = isValidPassword(password);
    notifyListeners();

    final isValid = [
      nameError,
      emailError,
      passwordError,
    ].every((element) => element == null);

    if (isValid) {
      callApi(() async {
        final ResponseDto<UserDto> responseDto = await AuthRepo.signUP(
            name.trimNonNull(), email.trimNonNull(), password.trimNonNull());

        if (responseDto.isSuccessful) {
          onSignUpSuccess?.call();
        } else {
          onError?.call(responseDto.message);
        }
      });
    }
  }

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
