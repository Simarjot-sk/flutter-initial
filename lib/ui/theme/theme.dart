import 'package:zumi_app/ui/utils/color_helpers.dart';
import 'package:flutter/material.dart';
import 'package:zumi_app/ui/theme/colors.dart';

ThemeData themeData = ThemeData(
  primarySwatch: createMaterialColor(
    AppColors.greenDark,
  ),
  colorScheme: const ColorScheme.light(
    primary: AppColors.greenDark,
    secondary: AppColors.orange,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Gilroy',
);
