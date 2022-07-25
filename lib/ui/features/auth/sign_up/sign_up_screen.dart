import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/bottom_sheet_heading.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/sign_up_message.dart';
import 'package:zumi_app/ui/features/auth/sign_in/widgets/terms_and_conditions.dart';
import 'package:zumi_app/ui/features/auth/sign_up/sign_up_view_model.dart';
import 'package:zumi_app/ui/features/auth/sign_up/widgets/sign_up_email_field.dart';
import 'package:zumi_app/ui/features/auth/sign_up/widgets/sign_up_name_field.dart';
import 'package:zumi_app/ui/features/auth/sign_up/widgets/sign_up_password_field.dart';
import 'package:zumi_app/ui/utils/base_classes/bottom_sheet_base.dart';
import 'package:zumi_app/ui/utils/base_classes/screen_base.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';
import 'package:zumi_app/ui/utils/misc_functions.dart';
import 'package:zumi_app/ui/utils/toasts.dart';
import 'package:zumi_app/ui/utils/widgets/common_button.dart';

class SignUpScreen extends StatefulWidget {
  static const String route = "SignUpScreenRoute";

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    withViewModel<SignUpViewModel>(context, (viewModel) {
      viewModel.onSignUpSuccess = () {
        successToast('Account Created Successfully');

        // navigating to home screen and clearing backstack
        Navigator.pushNamedAndRemoveUntil(
          context,
          "route",
          (_) => false,
        );
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenBaseScaffold<SignUpViewModel>(
      child: BottomSheetBase(
        topPortion: const BottomSheetHeading(
          text: 'Sign Up',
        ),
        bottomPortion: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const SignUpNameField(),
              const SignUpEmailField(),
              const SignUpPasswordField(),
              const SizedBox(),
              CommonButtonLoading<SignUpViewModel>(
                  onPressed: () {
                    hideKeyboard();
                    context.read<SignUpViewModel>().signUp();
                  },
                  text: 'Sign Up'),
              const TermsAndConditions(screenName: 'Sign Up'),
              SignUpMessage(
                firstText: 'Already have an account? ',
                secondText: 'Login',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ].withSpacing(height: 16),
          ),
        ),
      ),
    );
  }
}
