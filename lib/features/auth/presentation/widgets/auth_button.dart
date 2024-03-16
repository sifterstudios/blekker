import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:blekker/app/theme/custom_theme/elevated_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({required this.buttonText, super.key});
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      color: BlekkerColors.primaryColor,
      cupertino: (context, platform)
      => BlekkerElevatedButtonTheme.iosElevatedButtonTheme,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlatformText(
            buttonText,
            style: const TextStyle().copyWith(
              color: BlekkerColors.primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const Icon(
            Icons.arrow_right_sharp,
            color: BlekkerColors.primaryContrastColor,
            size: 35,
          ),
        ],
      ),
    );
  }
}