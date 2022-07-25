import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/sign_up/sign_up_view_model.dart';
import 'package:zumi_app/ui/utils/widgets/common_text_field.dart';

class SignUpEmailField extends StatelessWidget {
  const SignUpEmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select<SignUpViewModel, String?>(
      (SignUpViewModel state) => state.emailError,
    );
    return CommonTextField(
      textInputType: TextInputType.emailAddress,
      hintText: 'Email Address',
      label: 'Email Address',
      textInputAction: TextInputAction.done,
      errorMessage: errorMessage,
      onChanged: (String? email) {
        context.read<SignUpViewModel>().email = email;
      },
    );
  }
}
