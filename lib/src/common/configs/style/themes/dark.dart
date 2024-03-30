import 'package:flutter/material.dart';
import 'package:innovestage/src/common/utils/extensions/colors_extension.dart';

/// `getBaseDarkTheme` is a function that returns a Dark `ThemeData` for the app.
ThemeData getBaseDarkTheme({required Color seed}) {
  final ThemeData baseTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color.fromARGB(255, 120, 128, 134),
      ),
      labelMedium: TextStyle(
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color.fromARGB(255, 120, 128, 134),
      ),
      labelSmall: TextStyle(
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: Color.fromARGB(255, 120, 128, 134),
      ),
      titleLarge: TextStyle(
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Colors.white,
      ),
    ),
  ).copyWith(
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
    ),
  );
  return baseTheme.copyWith(
    extensions: [
      AppColorsExtension(
        primary: baseTheme.colorScheme.primary,
        onPrimary: baseTheme.colorScheme.onPrimary,
        secondary: baseTheme.colorScheme.secondary,
        onSecondary: baseTheme.colorScheme.onSecondary,
        error: const Color.fromARGB(255, 239, 83, 80),
        onError: baseTheme.colorScheme.onError,
        background: baseTheme.colorScheme.background,
        onBackground: baseTheme.colorScheme.onBackground,
        surface: baseTheme.colorScheme.surface,
        onSurface: baseTheme.colorScheme.onSurface,
        divider: Colors.grey[700]!,
        text: Colors.white,
        border: Colors.grey[600]!,
        card: Colors.grey.withOpacity(0.1),
        shadow: const Color.fromARGB(255, 211, 211, 211),
        success: const Color(0xff4CAF50),
        shimmerBase: const Color(0xffB4B4B4),
        shimmerHighlight: Colors.white,
        fill: const Color(0xff4CAF50),
      ),
    ],
  );
}
