import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

class BlekkerActionIconTheme {
  BlekkerActionIconTheme._();

  static ActionIconThemeData actionIconThemeData = ActionIconThemeData().copyWith(
    backButtonIconBuilder: (_) => Icon(
      Icons.arrow_back_sharp,
      color: BlekkerColors.primaryColor,
    ),
    closeButtonIconBuilder: (_) => Icon(
      Icons.close_sharp,
      color: BlekkerColors.primaryColor,
    ),
    drawerButtonIconBuilder: (_) => Icon(
      Icons.menu_sharp,
      color: BlekkerColors.primaryColor,
    ),
    endDrawerButtonIconBuilder: (_) => Icon(
      Icons.exit_to_app_sharp,
      color: BlekkerColors.primaryColor,
    ),
  );
}
