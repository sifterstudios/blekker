// Copyright 2024 Sifterstudios

import 'package:blekker/features/auth/presentation/widgets/auth_field.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  group('AuthField', () {
    final mockController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    testWidgets('displays error when field is empty', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Form(
              key: formKey,
              child: AuthField(
                key: const Key('field_key'),
                hintText: 'Test',
                controller: mockController,
              ),
            ),
          ),
        ),
      );

      final authField = find.byType(AuthField);
      expect(authField, findsOneWidget);
      final form = tester.widget<Form>(find.byType(Form));
      // validate the form

      await tester.enterText(authField, '');
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(formKey.currentState!.validate(), isFalse);
    });

    testWidgets('does not display error when field is not empty',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Form(
              key: formKey,
              child: AuthField(
                hintText: 'Test',
                controller: mockController,
              ),
            ),
          ),
        ),
      );

      final authField = find.byType(AuthField);
      expect(authField, findsOneWidget);

      await tester.enterText(authField, 'Test input');
      await tester.pump(const Duration(seconds: 1));

      expect(formKey.currentState!.validate(), isTrue);
    });
  });
}
