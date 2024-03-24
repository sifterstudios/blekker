// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';

@immutable
class BlekkerActionIconTheme {
  static ActionIconThemeData actionIconThemeData =
      const ActionIconThemeData().copyWith(
    backButtonIconBuilder: backButton,
    closeButtonIconBuilder: closeButton,
    drawerButtonIconBuilder: drawerButton,
    endDrawerButtonIconBuilder: endDrawerButton,
  );

  static Widget backButton(BuildContext context) {
    return const Icon(
      Icons.arrow_back_sharp,
      color: BlekkerColors.primaryColor,
    );
  }

  static Widget closeButton(BuildContext context) {
    return const Icon(
      Icons.close_sharp,
      color: BlekkerColors.primaryColor,
    );
  }

  static Widget drawerButton(BuildContext context) {
    return const Icon(
      Icons.menu_sharp,
      color: BlekkerColors.primaryColor,
    );
  }

  static Widget endDrawerButton(BuildContext context) {
    return const Icon(
      Icons.exit_to_app_sharp,
      color: BlekkerColors.primaryColor,
    );
  }
}
