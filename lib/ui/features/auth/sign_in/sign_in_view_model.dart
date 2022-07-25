import 'package:flutter/material.dart';
import 'package:zumi_app/data/repositories/auth_repo.dart';
import 'package:zumi_app/ui/utils/common_validations.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';

class SignInViewModel extends ViewModel with CommonValidations {
  String? email, emailError;
  String? password, passwordError;
  VoidCallback? onLoginSuccess;
  bool showPassword = false;

  void signIn() async {
    //if api calling is already in progress, then not calling api again
    if (isLoading) return;

    emailError = isValidEmail(email);
    passwordError = isValidPassword(password);
    notifyListeners();

    if (emailError == null && passwordError == null) {
      //all entries are valid, can call api

      callApi(() async {
        final responseDto = await AuthRepo.signIn(
          email?.trim() ?? "",
          password?.trim() ?? "",
        );
        switch (responseDto.status) {
          case 200:
            onLoginSuccess?.call();
            break;
          case 401:
          case 414:
            onError?.call('Email or Password is Incorrect');
            break;
          default:
            onError?.call(responseDto.message);
            break;
        }
      });
    }
  }

  void togglePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
