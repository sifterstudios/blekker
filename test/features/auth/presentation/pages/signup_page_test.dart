// Copyright 2024 Sifterstudios

import 'package:blekker/app/routes/go_routes.dart';
import 'package:blekker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blekker/features/auth/presentation/pages/signup_page.dart';
import 'package:blekker/features/auth/presentation/widgets/auth_button.dart';
import 'package:blekker/features/auth/presentation/widgets/auth_field.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pump_router_app.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class FakeAuthEvent extends Fake implements AuthEvent {}

class FakeAuthState extends Fake implements AuthState {}

void main() {
  group('SignupPage', () {
    late AuthBloc authBloc;

    setUp(() {
      authBloc = MockAuthBloc();
      when(() => authBloc.state).thenReturn(const AuthState.initial());
      registerFallbackValue(FakeAuthEvent());
    });
    testWidgets('is redirected when link is tapped', (tester) async {
      await tester.pumpRouterApp(
        const SignupPage(),
      );

      final textSpans = tester.widgetList<RichText>(find.byType(RichText));
      expect(textSpans.length, 7);

      await tester.tap(find.byWidget(textSpans.last));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
        find.byKey(Key(tester.getRouterKey(Routes.login))),
        findsOneWidget,
      );
    });

    testWidgets('changes event when tapping signup button', (tester) async {
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: authBloc,
            ),
          ],
          child: PlatformApp.router(
            title: 'Blekker',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: router(),
          ),
        ),
      );

      // find all AuthField widgets
      final authFields = tester.widgetList<AuthField>(find.byType(AuthField));
      expect(authFields.length, 3);
      for (final field in authFields) {
        field.controller.text = 'test';
      }
      await tester.tap(find.byType(AuthButton));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      verify(() => authBloc.add(const AuthEvent.signup('test', 'test', 'test')))
          .called(1);
    });
  });
}
