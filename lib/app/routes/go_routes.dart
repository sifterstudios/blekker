// Copyright 2024 Sifterstudios

import 'package:blekker/features/auth/presentation/pages/login_page.dart';
import 'package:blekker/features/auth/presentation/pages/signup_page.dart';
import 'package:equatable/equatable.dart';
import 'package:go_router/go_router.dart';

class Routes extends Equatable {
  static const home = '/';
  static const login = '/login';

  @override
  List<Object?> get props => [home, login];
}

GoRouter router([String? initialLocation]) => GoRouter(
      initialLocation: initialLocation ?? Routes.home,
      routes: [
        GoRoute(
          path: Routes.home,
          builder: (_, __) => const SignupPage(),
        ),
        GoRoute(
          path: Routes.login,
          builder: (_, __) => const LoginPage(),
        ),
      ],
    );
