import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/create_password/create_new_password_view_model.dart';
import 'package:zumi_app/ui/utils/widgets/common_password_field.dart';

class CreateNewPasswordConfirmField extends StatelessWidget {
  const CreateNewPasswordConfirmField({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final errorMessage = context.select<CreateNewPasswordViewModel, String?>(
      (final viewModel) => viewModel.confirmPasswordError,
    );
    return CommonPasswordField(
      label: 'Confirm Password',
      errorMessage: errorMessage,
      onChanged: (final String? confirmPassword) {
        context.read<CreateNewPasswordViewModel>().confirmPassword =
            confirmPassword;
      },
    );
  }
}
