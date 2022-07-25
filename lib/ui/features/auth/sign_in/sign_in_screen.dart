import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/forgot_password/forgot_password_screen.dart';
import 'package:zumi_app/ui/features/auth/sign_in/sign_in_view_model.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/bottom_sheet_heading.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/divider_or.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/forgot_my_password.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/sign_in_email_field.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/sign_in_password_field.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/sign_up_message.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/terms_and_conditions.dart';
import 'package:zumi_app/ui/utils/base_classes/bottom_sheet_base.dart';
import 'package:zumi_app/ui/utils/base_classes/screen_base.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';
import 'package:zumi_app/ui/utils/misc_functions.dart';
import 'package:zumi_app/ui/utils/toasts.dart';
import 'package:zumi_app/ui/utils/widgets/common_button.dart';

class SignInScreen extends StatefulWidget {
  static const String route = "SignInScreenRoute";

  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    super.initState();
    withViewModel<SignInViewModel>(context, (viewModel) {
      viewModel.onLoginSuccess = () {
        successToast('Logged In Successfully');

        //navigating to home screen and clearing backstack
        navigateToHome(context);
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBaseScaffold<SignInViewModel>(
      child: BottomSheetBase(
        topPortion: const BottomSheetHeading(
          text: "Sign in",
        ),
        bottomPortion: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            right: 16,
            left: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignInEmailField(),
              const SignInPasswordField(),
              ForgotMyPassword(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordScreen.route);
                },
              ),
              const DividerOr(),
              const SizedBox(height: 16),
              CommonButtonLoading<SignInViewModel>(
                  onPressed: () {
                    hideKeyboard();
                    context.read<SignInViewModel>().signIn();
                  },
                  text: 'Sign in'),
              const TermsAndConditions(
                screenName: 'Sign in',
              ),
              SignUpMessage(
                firstText: "Don't have an account? ",
                secondText: 'Sign Up',
                onTap: () {},
              ),
            ].withSpacing(height: 16),
          ),
        ),
      ),
    );
  }
}
