import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zumi_app/ui/features/auth/forgot_password/forgot_password_view_model.dart';
import 'package:zumi_app/ui/utils/widgets/common_phone_field.dart';

class ForgotPasswordPhoneField extends StatelessWidget {
  const ForgotPasswordPhoneField({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final errorMessage = context.select<ForgotPasswordViewModel, String?>(
      (final value) => value.phoneError,
    );
    return CommonPhoneField(
      errorMessage: errorMessage,
      onPhoneChanged: (final String? phone) {
        context.read<ForgotPasswordViewModel>().phone = phone;
      },
      onCountryChanged: (final Country code) {
        context.read<ForgotPasswordViewModel>().countryCode =
            code.phoneCode;
      },
    );
  }
}
