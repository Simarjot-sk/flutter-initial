import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/utils/base_classes/view_model.dart';

class CommonOutlinedButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color color;
  final Color? textColor;
  final bool _enabled;

  const CommonOutlinedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      bool? enabled,
      Color? color,
      Color? textColor})
      : color = color ?? Colors.white,
        _enabled = enabled ?? true,
        textColor = textColor ?? Colors.red,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide(color: color),
          ),
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: color,
          side: const BorderSide(color: Colors.yellow, width: 1)),
      onPressed: _enabled ? onPressed : null,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontFamily: 'SofiaPro-Bold',
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class CommonOutlinedButtonLoading<VM extends ViewModel>
    extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final String? textOnLoading;
  final Color? color;
  final Color? textColor;

  const CommonOutlinedButtonLoading({
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
      builder: (_, bool isLoading, __) => CommonOutlinedButton(
        color: color,
        enabled: !isLoading,
        onPressed: onPressed,
        text: isLoading ? textOnLoading ?? 'Please Wait...' : text,
        textColor: textColor,
      ),
    );
  }
}
