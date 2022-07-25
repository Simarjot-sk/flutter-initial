import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/create_password/create_new_password_view_model.dart';
import 'package:zumi_app/ui/features/auth/create_password/widgets/create_new_password_confirm_field.dart';
import 'package:zumi_app/ui/features/auth/create_password/widgets/create_new_password_field.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/bottom_sheet_heading.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';
import 'package:zumi_app/ui/utils/base_classes/bottom_sheet_base.dart';
import 'package:zumi_app/ui/utils/base_classes/screen_base.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';
import 'package:zumi_app/ui/utils/toasts.dart';
import 'package:zumi_app/ui/utils/widgets/common_button.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  static const String route = "CreateNewPasswordScreenRoute";

  const CreateNewPasswordScreen({final Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  void initState() {
    withViewModel<CreateNewPasswordViewModel>(context, (final viewModel) {
      viewModel.onPasswordUpdated = () {
        successToast(
          'Password Updated Successfully, Please Sign in to continue',
        );
        Navigator.pop(context);
      };
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return ScreenBaseScaffold<CreateNewPasswordViewModel>(
      child: BottomSheetBase(
        topPortion: const BottomSheetHeading(
          text: 'Create new\npassword',
          showBackButton: true,
        ),
        bottomPortion: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 60),
          child: Column(
            children: [
              Text(
                'Your password must be different from a previously used password',
                style: Gilroy.medium(AppColors.grayFont).s16,
              ),
              const SizedBox(height: 32),
              const CreateNewPasswordField(),
              const SizedBox(height: 16),
              const CreateNewPasswordConfirmField(),
              const SizedBox(height: 50),
              CommonButton(
                onPressed: () {
                  context
                      .read<CreateNewPasswordViewModel>()
                      .createNewPassword();
                },
                text: 'Set Password',
              )
            ],
          ),
        ),
      ),
    );
  }
}
