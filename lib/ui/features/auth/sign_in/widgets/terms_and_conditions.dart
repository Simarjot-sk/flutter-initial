import 'package:flutter/material.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';

class TermsAndConditions extends StatelessWidget {
  final String screenName;

  const TermsAndConditions({Key? key, required this.screenName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blackStyle = Monrope.medium().s14;
    final greenStyle = Monrope.medium(AppColors.greenDark).s14;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: RichText(
        text: TextSpan(
          text: 'By clicking $screenName, you agree to our',
          style: blackStyle,
          children: [
            TextSpan(text: ' Terms and Conditions', style: greenStyle),
            TextSpan(text: ' and ', style: blackStyle),
            TextSpan(text: 'Privacy Policy', style: greenStyle)
          ],
        ),
      ),
    );
  }
}
