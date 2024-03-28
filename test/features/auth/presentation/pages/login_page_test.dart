// Copyright 2024 Sifterstudios

import 'package:blekker/app/routes/go_routes.dart';
import 'package:blekker/features/auth/presentation/pages/login_page.dart';
import 'package:blekker/features/auth/presentation/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/pump_router_app.dart';

void main() {
  group('LoginPage', () {
    testWidgets('is redirected when link is tapped', (tester) async {
      await tester.pumpRouterApp(
        const LoginPage(),
      );

      final textSpans = tester.widgetList<RichText>(find.byType(RichText));
      expect(textSpans.length, 6);

      await tester.tap(find.byWidget(textSpans.last));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.byKey(Key(tester.getRouterKey(Routes.home))), findsOneWidget);
    });

    testWidgets('does nothing when login-button is tapped', (tester) async {
      await tester.pumpRouterApp(
        const LoginPage(),
      );

      await tester.tap(find.byType(AuthButton));
      expect(tester.takeException(), isInstanceOf<UnimplementedError>());

      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}
