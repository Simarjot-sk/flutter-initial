import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/sign_up/sign_up_view_model.dart';
import 'package:zumi_app/ui/utils/widgets/common_text_field.dart';

class SignUpNameField extends StatelessWidget {
  const SignUpNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select<SignUpViewModel, String?>(
      (SignUpViewModel state) => state.nameError,
    );
    return CommonTextField(
      hintText: 'Full Name',
      label: 'Name',
      textInputType: TextInputType.name,
      errorMessage: errorMessage,
      onChanged: (String? value) {
        context.read<SignUpViewModel>().name = value;
      },
    );
  }
}
