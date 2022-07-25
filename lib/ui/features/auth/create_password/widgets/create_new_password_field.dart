import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/create_password/create_new_password_view_model.dart';
import 'package:zumi_app/ui/utils/widgets/common_password_field.dart';

class CreateNewPasswordField extends StatelessWidget {
  const CreateNewPasswordField({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final errorMessage = context.select<CreateNewPasswordViewModel, String?>(
      (final viewModel) => viewModel.newPasswordError,
    );
    return CommonPasswordField(
      label: 'New Password',
      onChanged: (final String? newPassword) {
        context.read<CreateNewPasswordViewModel>().newPassword = newPassword;
      },
      errorMessage: errorMessage,
    );
  }
}
