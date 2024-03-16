import 'package:blekker/features/auth/presentation/pages/login_page.dart';
import 'package:blekker/features/auth/presentation/pages/signup_page.dart';
import 'package:go_router/go_router.dart';

class BlekkerRoutes {
  BlekkerRoutes._();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
    ],
  );
}
