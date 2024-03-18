import 'package:blekker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blekker/features/auth/presentation/widgets/auth_button.dart';
import 'package:blekker/features/auth/presentation/widgets/auth_field.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEvent.started());
    final l10n = context.l10n;
    return PlatformScaffold(
      appBar: PlatformAppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlatformText(
                l10n.authSignupHeader,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              AuthField(
                hintText: l10n.authName,
                controller: nameController,
              ),
              const SizedBox(
                height: 15,
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
                buttonText: l10n.authSignupButton,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          AuthEvent.signup(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text,
                          ),
                        );
                  }
                },
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  context.push('/login');
                },
                child: RichText(
                  text: TextSpan(
                    text: l10n.authExistingUserPromptStart,
                    style: Theme.of(context).textTheme.labelSmall,
                    children: [
                      TextSpan(
                        text: l10n.authExistingUserPromptEnd,
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
