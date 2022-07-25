import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/sign_up/sign_up_view_model.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/utils/widgets/common_text_field.dart';

class SignUpPasswordField extends StatelessWidget {
  const SignUpPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select<SignUpViewModel, String?>(
      (SignUpViewModel state) => state.passwordError,
    );
    final showPassword = context.select<SignUpViewModel, bool>(
      (SignUpViewModel state) => state.showPassword,
    );

    return CommonTextField(
      textInputType: TextInputType.visiblePassword,
      label: 'Password',
      hintText: '******',
      obscureText: !showPassword,
      suffixIcon: GestureDetector(
        child: _suffixIcon(showPassword),
        onTap: () {
          context.read<SignUpViewModel>().togglePasswordVisibility();
        },
      ),
      textInputAction: TextInputAction.done,
      errorMessage: errorMessage,
      onChanged: (String? password) {
        context.read<SignUpViewModel>()
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
