import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/sign_in/sign_in_view_model.dart';
import 'package:zumi_app/ui/utils/widgets/common_text_field.dart';

class SignInEmailField extends StatelessWidget {
  const SignInEmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select<SignInViewModel, String?>(
      (SignInViewModel state) => state.emailError,
    );
    return CommonTextField(
      textInputType: TextInputType.emailAddress,
      hintText: 'Email Address',
      label: 'Email Address',
      textInputAction: TextInputAction.done,
      errorMessage: errorMessage,
      onChanged: (String? email) {
        context.read<SignInViewModel>().email = email;
      },
    );
  }
}
