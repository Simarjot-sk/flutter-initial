import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/utils/widgets/common_text_field.dart';

class CommonPasswordField extends StatefulWidget {
  final String label;
  final String? errorMessage;
  final ValueChanged<String?> onChanged;

  const CommonPasswordField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.errorMessage,
  }) : super(key: key);

  @override
  State<CommonPasswordField> createState() => _CommonPasswordFieldState();
}

class _CommonPasswordFieldState extends State<CommonPasswordField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      textInputType: TextInputType.visiblePassword,
      label: widget.label,
      hintText: '******',
      obscureText: !showPassword,
      textInputAction: TextInputAction.done,
      errorMessage: widget.errorMessage,
      onChanged: widget.onChanged,
      suffixIcon: GestureDetector(
        child: _suffixIcon(showPassword),
        onTap: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
      ),
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
