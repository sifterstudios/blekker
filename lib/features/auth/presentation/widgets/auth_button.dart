import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n.authSignupButton,
            style: const TextStyle().copyWith(
              color: BlekkerColors.primaryContrastColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.arrow_right_sharp,
            color: BlekkerColors.primaryContrastColor,
            applyTextScaling: true,
          ),
        ],
      ),
    );
  }
}
