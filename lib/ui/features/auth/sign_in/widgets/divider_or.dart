import 'package:flutter/material.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final line = Container(
      color: AppColors.grayBorder,
      height: 1,
    );
    return Row(
      children: [
        Expanded(child: line),
        SizedBox(
          width: 30,
          child: Text('Or',
              textAlign: TextAlign.center,
              style: Gilroy.semiBold(AppColors.greenDark).s12),
        ),
        Expanded(child: line)
      ],
    );
  }
}
