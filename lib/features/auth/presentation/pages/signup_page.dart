import 'package:blekker/app/theme/custom_theme/text_theme.dart';
import 'package:blekker/features/auth/presentation/widgets/auth_button.dart';
import 'package:blekker/features/auth/presentation/widgets/auth_field.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.authSignupHeader,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            AuthField(hintText: l10n.authName),
            const SizedBox(
              height: 15,
            ),
            AuthField(hintText: l10n.authEmail),
            const SizedBox(
              height: 15,
            ),
            AuthField(hintText: l10n.authPassword),
            const SizedBox(
              height: 15,
            ),
            const AuthButton(),
            const SizedBox(
              height: 15,
            ),
            RichText(
              text:
                  TextSpan(text: 'Already have an account? ', style: Theme.of(context).textTheme.labelSmall, children: [
                TextSpan(
                  text: 'Sign in',
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
