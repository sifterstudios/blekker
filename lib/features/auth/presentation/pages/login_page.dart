// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:blekker/features/auth/presentation/widgets/auth_button.dart';
import 'package:blekker/features/auth/presentation/widgets/auth_field.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return PlatformScaffold(
      appBar: PlatformAppBar(
        material: (_, __) => MaterialAppBarData(
          backgroundColor: BlekkerColors.primaryContrastColor,
          centerTitle: false,
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l10n.authLoginHeader,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              AuthField(
                hintText: l10n.authEmail,
                controller: emailController,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthField(
                hintText: l10n.authPassword,
                controller: passwordController,
                isObscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthButton(
                buttonText: l10n.authLoginButton,
                onPressed: () {
                  throw UnimplementedError();
                },
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () => context.go('/'),
                child: RichText(
                  text: TextSpan(
                    text: l10n.authNewUserPromptStart,
                    style: Theme.of(context).textTheme.labelSmall,
                    children: [
                      TextSpan(
                        text: l10n.authNewUserPromptEnd,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
