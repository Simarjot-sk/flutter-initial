import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zumi_app/ui/theme/colors.dart';
import 'package:zumi_app/ui/theme/typography.dart';
import 'package:zumi_app/ui/utils/widgets/common_text_field.dart';

class CommonPhoneField extends StatefulWidget {
  final ValueChanged<String?> onPhoneChanged;
  final ValueChanged<Country> onCountryChanged;
  final String? initialText, errorMessage;

  const CommonPhoneField({
    Key? key,
    required this.onPhoneChanged,
    required this.onCountryChanged,
    this.initialText,
    this.errorMessage,
  }) : super(key: key);

  @override
  State<CommonPhoneField> createState() => _CommonPhoneFieldState();
}

class _CommonPhoneFieldState extends State<CommonPhoneField> {
  Country selectedCountry = CountryService().findByCode('us')!;

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      hintText: '567 8901',
      label: 'Enter Phone Number',
      onChanged: widget.onPhoneChanged,
      initialText: widget.initialText,
      formatter: [FilteringTextInputFormatter.digitsOnly],
      textInputType: TextInputType.number,
      textInputAction: TextInputAction.done,
      errorMessage: widget.errorMessage,
      prefix: _createCountryCodePicker(context, selectedCountry),
    );
  }

  Widget _createCountryCodePicker(BuildContext context, Country country) {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
            context: context,
            onSelect: (Country country) {
              setState(() {
                selectedCountry = country;
              });
              widget.onCountryChanged(country);
            });
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.grayBorder,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          width: 86,
          height: 36,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(country.flagEmoji),
              Text(
                country.phoneCode,
                style: Gilroy.medium(AppColors.grayFont).s16,
              ),
              const Icon(Icons.arrow_drop_down, color: AppColors.grayFont)
            ],
          ),
        ),
      ),
    );
  }
}
