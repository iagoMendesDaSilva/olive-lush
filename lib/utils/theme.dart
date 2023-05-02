import 'package:flutter/material.dart';
import 'package:olive_lush/utils/colors.dart' as AppColors;
import 'package:olive_lush/utils/type.dart' as Typography;

final ThemeData light = ThemeData(
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    background: AppColors.background,
    surface: AppColors.scaffoldBackground,
  ),
  primaryColor: AppColors.primary,
  textTheme: Typography.textTheme.copyWith(
      bodySmall: Typography.textTheme.bodySmall?.copyWith(color: AppColors.whiteTextOpacity),
      labelSmall: Typography.textTheme.labelSmall?.copyWith(color: AppColors.whiteTextOpacity),
  ),
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
);

final ThemeData dark = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
    background: AppColors.backgroundDark,
    surface: AppColors.scaffoldBackgroundDark,
  ),
  primaryColor: AppColors.primary,
  textTheme: Typography.textTheme.copyWith(
    bodySmall: Typography.textTheme.bodySmall?.copyWith(color: AppColors.darkTextOpacity),
    labelSmall: Typography.textTheme.labelSmall?.copyWith(color: AppColors.darkTextOpacity),
  ),
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
);
