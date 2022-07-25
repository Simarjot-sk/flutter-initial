import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';

class CommonButton extends StatelessWidget {
  static const double borderRadius = 14.0;
  static const double buttonHeight = 60.0;

  final void Function() onPressed;
  final String text;
  final Color color;
  final Color? textColor;
  final bool _enabled;

  const CommonButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      bool? enabled,
      Color? color,
      Color? textColor})
      : color = color ?? AppColors.greenDark,
        _enabled = enabled ?? true,
        textColor = textColor ?? AppColors.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: color),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, buttonHeight)),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: _enabled ? onPressed : null,
      child: Text(
        text,
        style: Gilroy.semiBold(AppColors.white).s18,
      ),
    );
  }
}

class CommonButtonLoading<VM extends ViewModel> extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final String? textOnLoading;
  final Color? color;
  final Color? textColor;

  const CommonButtonLoading({
    Key? key,
    required this.text,
    required this.onPressed,
    this.textOnLoading,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<VM, bool>(
      selector: (_, VM state) => state.isLoading,
      builder: (_, bool isLoading, __) => CommonButton(
        color: color,
        enabled: !isLoading,
        onPressed: onPressed,
        text: isLoading ? textOnLoading ?? 'Please Wait...' : text,
        textColor: textColor,
      ),
    );
  }
}
