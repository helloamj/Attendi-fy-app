import 'package:attendify/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData instance = ThemeData.dark().copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    primaryColor: AppPallete.primaryGreen.level1,
    buttonTheme: ButtonThemeData(
      buttonColor: AppPallete.primaryGreen.level1,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        iconColor: WidgetStateProperty.all(AppPallete.primaryWhite.level4!),
        backgroundColor:
            WidgetStateProperty.all(AppPallete.primaryWhite.level1),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
    ),
  );
}
