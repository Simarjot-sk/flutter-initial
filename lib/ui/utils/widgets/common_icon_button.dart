import 'package:flutter/material.dart';

class CommonIconButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color color;
  final Color? textColor;
  final bool _enabled;
  final Widget icon;

  const CommonIconButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.icon,
      bool? enabled,
      Color? color,
      Color? textColor})
      : color = color ?? const Color(0xffF06C6F),
        _enabled = enabled ?? true,
        textColor = textColor ?? const Color(0xff1C5572),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
            side: BorderSide(color: color),
          ),
        ),
        minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: _enabled ? onPressed : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontFamily: 'SofiaPro-Bold',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 16),
          icon
        ],
      ),
    );
  }
}
