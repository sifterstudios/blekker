// Copyright 2024 Sifterstudios

import 'package:blekker/app/routes/go_routes.dart';
import 'package:blekker/features/auth/domain/repository/auth_repository.dart';
import 'package:blekker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blekker/features/auth/presentation/pages/login_page.dart';
import 'package:blekker/features/auth/presentation/widgets/auth_button.dart';
import 'package:blekker/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pump_real_router_app.dart';
import '../../../../helpers/pump_router_app.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockAuthBloc extends Mock implements AuthBloc {}

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
      await tester.pumpRealRouterApp(
        location: Routes.login,
        builder: (child) => child,
      );

      final authBloc = serviceLocator<AuthBloc>();

      await tester.runAsync(() async {
        await tester.pumpAndSettle(const Duration(seconds: 1));
      });
      await tester.pumpAndSettle();

      await tester.tap(find.byType(AuthButton));

      expect(find.byType(PlatformCircularProgressIndicator), findsOneWidget);
    });
  });
}
