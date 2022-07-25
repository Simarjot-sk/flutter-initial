import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/sign_in/sign_in_view_model.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/utils/widgets/common_text_field.dart';

class SignInPasswordField extends StatelessWidget {
  const SignInPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select<SignInViewModel, String?>(
      (SignInViewModel state) => state.passwordError,
    );
    final showPassword = context.select<SignInViewModel, bool>(
      (SignInViewModel state) => state.showPassword,
    );

    return CommonTextField(
      textInputType: TextInputType.visiblePassword,
      label: 'Password',
      hintText: '******',
      obscureText: !showPassword,
      suffixIcon: GestureDetector(
        child: _suffixIcon(showPassword),
        onTap: () {
          context.read<SignInViewModel>().togglePasswordVisibility();
        },
      ),
      textInputAction: TextInputAction.done,
      errorMessage: errorMessage,
      onChanged: (String? password) {
        context.read<SignInViewModel>()
          ..password = password
          ..passwordError = null;
      },
    );
  }

  Widget _suffixIcon(bool showPassword) {
    final fileName =
        showPassword ? 'password_visible.svg' : 'password_obscured.svg';
    return SizedBox(
      width: 24,
      height: 24,
      child: SvgPicture.asset(
        'assets/icons/$fileName',
        color: AppColors.greenDark,
      ),
    );
  }
}
