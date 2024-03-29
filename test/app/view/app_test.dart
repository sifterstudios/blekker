// Copyright 2024 Sifterstudios

import 'package:blekker/app/app.dart';
import 'package:blekker/features/auth/presentation/pages/signup_page.dart';
import 'package:blekker/init_dependencies.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders SignupPage', (tester) async {
      await serviceLocator.reset();
      await tester.pumpWidget(const App());
      expect(find.byType(SignupPage), findsOneWidget);
    });
  });
}
