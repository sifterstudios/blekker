// Copyright 2024 Sifterstudios

import 'package:blekker/app/routes/go_routes.dart';
import 'package:blekker/features/auth/presentation/pages/login_page.dart';
import 'package:blekker/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/pump_route.dart';

void main() {
  group('GoRouter', () {
    testWidgets('renders LoginPage via Router', (tester) async {
      await tester.pumpRealRouterApp(
        location: Routes.login,
        builder: (child) => child,
      );
      expect(find.byType(LoginPage), findsOneWidget);
    });
    testWidgets('renders SignupPage via Router', (tester) async {
      await tester.pumpRealRouterApp(
        location: Routes.home,
        builder: (child) => child,
      );
      expect(find.byType(SignupPage), findsOneWidget);
    });
  });
}
