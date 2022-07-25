import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/data/local/shared_pref_helper.dart';
import 'package:zumi_app/ui/features/auth/forgot_password/forgot_password_view_model.dart';
import 'package:zumi_app/ui/features/auth/forgot_password/widgets/forgot_password_phone_field.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/bottom_sheet_heading.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';
import 'package:zumi_app/ui/utils/base_classes/bottom_sheet_base.dart';
import 'package:zumi_app/ui/utils/base_classes/screen_base.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';
import 'package:zumi_app/ui/utils/misc_functions.dart';
import 'package:zumi_app/ui/utils/widgets/common_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String route = 'ForgotPasswordScreenRoute';

  const ForgotPasswordScreen({final Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  void initState() {
    withViewModel<ForgotPasswordViewModel>(context, (final viewModel) {
      viewModel.onOtpSent = () {
        Navigator.pushReplacementNamed(context, "route");
      };
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return ScreenBaseScaffold<ForgotPasswordViewModel>(
      child: BottomSheetBase(
        topPortion: const BottomSheetHeading(
          text: "Reset Password",
          showBackButton: true,
        ),
        bottomPortion: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40,
              right: 16,
              left: 16,
              bottom: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Text(
                    'Enter your phone number associated with your account and we’ll send a verification code to reset your password',
                    style: Gilroy.semiBold(AppColors.grayFont).s16,
                  ),
                ),
                const SizedBox(height: 25),
                const ForgotPasswordPhoneField(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                CommonButtonLoading<ForgotPasswordViewModel>(
                  onPressed: () {
                    hideKeyboard();
                    context.read<ForgotPasswordViewModel>().requestOTP();
                  },
                  text: 'Reset Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
