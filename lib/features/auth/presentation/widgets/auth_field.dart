import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AuthField extends StatelessWidget {
  const AuthField({
    required this.hintText,
    required this.controller,
    this.isObscureText = false,
    super.key,
  });

  final String hintText;
  final TextEditingController controller;
  final bool isObscureText;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PlatformTextFormField(
      cupertino: (context, platform) => CupertinoTextFormFieldData(),
      hintText: hintText,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return l10n.authFormError;
        }
        return null;
      },
      obscureText: isObscureText,
    );
  }
}
