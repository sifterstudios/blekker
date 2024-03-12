import 'package:blekker/app/theme/custom_theme/action_icon_theme.dart';
import 'package:blekker/app/theme/custom_theme/app_bar_theme.dart';
import 'package:blekker/app/theme/custom_theme/button_theme.dart';
import 'package:blekker/app/theme/custom_theme/color_scheme.dart';
import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:blekker/app/theme/custom_theme/elevated_button_theme.dart';
import 'package:blekker/app/theme/custom_theme/floating_action_button_theme.dart';
import 'package:blekker/app/theme/custom_theme/input_decoration_theme.dart';
import 'package:blekker/app/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class BlekkerAppTheme{
  BlekkerAppTheme._();

  static ThemeData lightTheme = ThemeData();
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: BlekkerColors.primaryColor,
    scaffoldBackgroundColor: BlekkerColors.primaryContrastColor,
    textTheme:  BlekkerTextTheme.textTheme,
    actionIconTheme: BlekkerActionIconTheme.actionIconThemeData,
    appBarTheme: BlekkerAppBarTheme.appBarTheme,
    colorScheme: BlekkerColorScheme.darkColorScheme,
    inputDecorationTheme: BlekkerInputDecorationTheme.inputDecorationTheme,
    floatingActionButtonTheme: BlekkerFabTheme.fabTheme,
    buttonTheme: BlekkerButtonTheme.buttonTheme,
    elevatedButtonTheme: BlekkerElevatedButtonTheme.theme,
  );
}
