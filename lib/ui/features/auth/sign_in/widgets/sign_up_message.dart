import 'package:flutter/material.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';

class SignUpMessage extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback onTap;

  const SignUpMessage({
    Key? key,
    required this.firstText,
    required this.secondText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: RichText(
          text: TextSpan(
            text: firstText,
            style: Gilroy.medium().s14,
            children: [
              TextSpan(
                text: secondText,
                style: Gilroy.medium(AppColors.greenDark).s14.copyWith(
                      decoration: TextDecoration.underline,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
