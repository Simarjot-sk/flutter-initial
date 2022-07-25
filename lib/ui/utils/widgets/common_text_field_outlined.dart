import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';
import 'package:zumi_app/ui/utils/widgets/my_card.dart';

class CommonTextFieldOutlined extends StatefulWidget {
  CommonTextFieldOutlined({
    Key? key,
    required this.hintText,
    required this.label,
    required this.textInputType,
    this.suffixIcon,
    this.obscureText,
    this.initialText,
    this.readOnly,
    this.maxLines,
    this.onChanged,
    this.errorMessage,
    this.formatter,
    this.prefix,
    TextInputAction? textInputAction,
  })  : textInputAction = textInputAction ?? TextInputAction.next,
        super(key: key);

  final String label;
  final String hintText;
  final String? initialText;
  String? errorMessage;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final bool? obscureText, readOnly;
  final Function(String?)? onChanged;
  final int? maxLines;
  final List<TextInputFormatter>? formatter;
  final Widget? prefix;

  @override
  State<CommonTextFieldOutlined> createState() => _CommonTextFieldOutlinedState();
}

class _CommonTextFieldOutlinedState extends State<CommonTextFieldOutlined> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, bottom: 10),
          child: Text(widget.label,
              style: Gilroy.semiBold().s14),
        ),
        TextFormField(
          textInputAction: widget.textInputAction,
          inputFormatters: widget.formatter,
          style: Gilroy.medium().s16,
          initialValue: widget.initialText,
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText ?? false,
          maxLines: widget.maxLines ?? 1,
          readOnly: widget.readOnly ?? false,
          decoration: InputDecoration(
            prefixIcon: widget.prefix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.grayBorderLight,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: Gilroy.medium(AppColors.grayHint).s16,
            suffixIcon: widget.suffixIcon != null
                ? SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(child: widget.suffixIcon),
                  )
                : null,
          ),
          onChanged: (String value) {
            ///As soon as user starts typing, we will remove the error message.
            ///And error message will be shown again when validations will be triggered on button click.
            if (widget.errorMessage != null) {
              setState(() {
                widget.errorMessage = null;
              });
            }
            widget.onChanged?.call(value);
          },
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            widget.errorMessage ?? "",
            style: Gilroy.bold(AppColors.redError).s13,
          ),
        )
      ],
    );
  }
}
