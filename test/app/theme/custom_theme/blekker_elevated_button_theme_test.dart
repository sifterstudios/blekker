// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:blekker/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlekkerElevatedButtonTheme', () {
    testWidgets('renders elevated button', (tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return MaterialApp(
              home: ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated Button'),
              ),
            );
          },
        ),
      );
      expect(find.text('Elevated Button'), findsOneWidget);
    });

    // Test for different MaterialStateProperty values
    testWidgets(
        'renders elevated button with different MaterialStateProperty values',
        (tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return MaterialApp(
              theme: BlekkerAppTheme.darkTheme,
              home: Scaffold(
                body: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
              ),
            );
          },
        ),
      );

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      final elevatedButtonStyle =
          Theme.of(tester.element(find.byType(ElevatedButton)))
              .elevatedButtonTheme
              .style;

      expect(
        elevatedButtonStyle!.foregroundColor!.resolve(<MaterialState>{}),
        BlekkerColors.primaryColor,
      );
      expect(
        elevatedButtonStyle.foregroundColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        BlekkerColors.primaryContrastColor,
      );

      expect(
        elevatedButtonStyle.backgroundColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        BlekkerColors.primaryContrastColor,
      );

      expect(
        elevatedButtonStyle.textStyle!
            .resolve(<MaterialState>{MaterialState.pressed})?.color,
        BlekkerColors.secondaryColor,
      );
    });
  });
}
