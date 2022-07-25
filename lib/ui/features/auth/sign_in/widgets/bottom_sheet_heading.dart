import 'package:flutter/material.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';

class BottomSheetHeading extends StatelessWidget {
  final String text;
  final bool showBackButton;

  const BottomSheetHeading({
    required this.text,
    this.showBackButton = false,
    final Key? key,
  }) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (showBackButton)
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 20),
                  child: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: AppColors.greenDark,
                  ),
                ),
              ),
            Text(
              text,
              style: showBackButton
                  ? Gilroy.semiBold(AppColors.greenDark).s24
                  : Gilroy.semiBold(AppColors.greenDark).s36,
            ),
          ],
        ),
      ),
    );
  }
}
