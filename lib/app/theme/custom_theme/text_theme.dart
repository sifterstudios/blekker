import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlekkerTextTheme {
  BlekkerTextTheme._();
  static TextTheme textTheme = TextTheme(
    displayLarge: const TextStyle().copyWith(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.mainTextColor,
    ),
    displayMedium: const TextStyle().copyWith(
      fontSize: 45,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.mainTextColor,
    ),
    displaySmall: const TextStyle().copyWith(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.mainTextColor,
    ),
    headlineLarge: const TextStyle().copyWith(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.headlineLargeColor,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.headlineMediumColor,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.headlineLargeColor,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.titleLargeColor,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.titleMediumColor,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.titleSmallColor,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.labelLargeColor,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.labelMediumColor,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 11,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.labelSmallColor,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.bodyLargeColor,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.bodyMediumColor,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.bodySmallColor,
    ),
  );
  static CupertinoTextThemeData cupertinoTextTheme =
  const CupertinoTextThemeData(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.labelSmallColor,
    ),
    actionTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.labelSmallColor,
    ),
    tabLabelTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.labelSmallColor,
    ),
    navTitleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.titleLargeColor,
    ),
    navLargeTitleTextStyle: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.headlineMediumColor,
    ),
    pickerTextStyle: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.mainTextColor,
    ),
    dateTimePickerTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: BlekkerColors.bodyLargeColor,
    ),
  );
}
