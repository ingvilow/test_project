import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_case/assets/colors/colors.dart';

/// класс для устанвки темы в приложении
class AppTheme {
  static const appBarTheme = AppBarTheme(
    backgroundColor: ColorTypography.typographyTertiary,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: ColorTypography.typographyTertiary,
    ),
  );

  static ThemeData get defaultTheme => ThemeData(
        backgroundColor: ColorTypography.typographyTertiary,
        appBarTheme: appBarTheme,
        scaffoldBackgroundColor: ColorTypography.typographyTertiary,
      );
}
