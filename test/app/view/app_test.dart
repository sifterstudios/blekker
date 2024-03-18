import 'package:blekker/app/app.dart';
import 'package:blekker/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders SignupPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(SignupPage), findsOneWidget);
    });
  });
}
