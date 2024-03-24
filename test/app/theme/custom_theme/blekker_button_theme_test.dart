// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/color_scheme.dart';
import 'package:blekker/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlekkerButtonTheme', () {
    testWidgets('renders button with blekkerButtonTheme', (tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return MaterialApp(
              theme: BlekkerAppTheme.darkTheme,
              home: Scaffold(
                body: MaterialButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
              ),
            );
          },
        ),
      );

      final buttonThemeData =
          Theme.of(tester.element(find.byType(MaterialButton))).buttonTheme;

      expect(
        buttonThemeData.shape,
        const Border.symmetric(),
      );
      expect(
        buttonThemeData.colorScheme,
        BlekkerColorScheme.darkColorScheme,
      );
      expect(
        buttonThemeData.padding,
        const EdgeInsets.all(30),
      );
    });
  });
}
