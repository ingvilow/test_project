import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:test_case/assets/colors/colors.dart';

//ignore_for_file: public_member_api_docs

/// Styles of texts.

const TextStyle titleBig = TextStyle(
  fontWeight: FontWeight.w500,
  color: ColorTypography.typographyPrimary,
  fontSize: 16,
);

const TextStyle titleSmall = TextStyle(
  fontWeight: FontWeight.w400,
  color: ColorTypography.typographySecondary,
  fontSize: 14,
);

const TextStyle titleSmaller = TextStyle(
  fontWeight: FontWeight.w700,
  color: ColorTypography.typographyTertiary,
  fontSize: 14,
);

const TextStyle appBarMainScreen = TextStyle(
  fontWeight: FontWeight.w700,
  color: ColorTypography.typographyPrimary,
  fontSize: 32,
);

const TextStyle _text = TextStyle(
  fontStyle: FontStyle.normal,
  color: textColorPrimary,
);

const TextStyle bigTextErrorStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 18,
  color: ColorTypography.errorTextColor,
);

const TextStyle smallTextErrorStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: ColorTypography.typographyTertiary,
);

/// тема приложения
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

//Light
TextStyle textLight = _text.copyWith(fontWeight: FontWeight.w300);

//Regular
TextStyle textRegular = _text.copyWith(fontWeight: FontWeight.normal);
TextStyle textRegular16 = textRegular.copyWith(fontSize: 16.0);
TextStyle textRegular16Secondary =
    textRegular16.copyWith(color: textColorSecondary);
TextStyle textRegular16Grey = textRegular16.copyWith(color: textColorGrey);

//Medium
TextStyle textMedium = _text.copyWith(fontWeight: FontWeight.w500);
TextStyle textMedium20 = textMedium.copyWith(fontSize: 20.0);

//Bold
TextStyle textBold = _text.copyWith(fontWeight: FontWeight.bold);
