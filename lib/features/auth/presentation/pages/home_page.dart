// Copyright 2024 Sifterstudios

import 'package:blekker/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          const Text('Logged in!'),
          AuthButton(
            buttonText: 'Log OUT',
            onPressed: () => context.go('/login'),
          ),
        ],
      ),
    );
  }
}
