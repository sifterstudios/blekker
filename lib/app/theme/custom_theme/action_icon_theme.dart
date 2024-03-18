import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

class BlekkerActionIconTheme {
  BlekkerActionIconTheme._();

  static ActionIconThemeData actionIconThemeData =
      const ActionIconThemeData().copyWith(
    backButtonIconBuilder: (_) => const Icon(
      Icons.arrow_back_sharp,
      color: BlekkerColors.primaryColor,
    ),
    closeButtonIconBuilder: (_) => const Icon(
      Icons.close_sharp,
      color: BlekkerColors.primaryColor,
    ),
    drawerButtonIconBuilder: (_) => const Icon(
      Icons.menu_sharp,
      color: BlekkerColors.primaryColor,
    ),
    endDrawerButtonIconBuilder: (_) => const Icon(
      Icons.exit_to_app_sharp,
      color: BlekkerColors.primaryColor,
    ),
  );
}
