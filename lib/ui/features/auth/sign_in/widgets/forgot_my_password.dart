import 'package:flutter/material.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';
class ForgotMyPassword extends StatelessWidget {
  final VoidCallback onTap;
  const ForgotMyPassword({final Key? key,  required this.onTap,}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          'Forgot Password',
          style: Gilroy.medium(AppColors.greenDark).s12,
        ),
      ),
    );
  }
}
