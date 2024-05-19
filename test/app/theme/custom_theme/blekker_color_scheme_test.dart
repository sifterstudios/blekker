// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/color_scheme.dart';
import 'package:blekker/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('colorscheme matches BlekkerColorScheme darkColorScheme',
      (tester) async {
    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        theme: BlekkerAppTheme.darkTheme,
        home: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              body: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Label',
                ),
              ),
            );
          },
        ),
      ),
    );
    // Assert
    final actual =
        Theme.of(tester.element(find.byType(TextFormField))).colorScheme;
    final expected = BlekkerColorScheme.darkColorScheme;

    expect(
      actual.brightness,
      expected.brightness,
    );
    expect(
      actual.primary,
      expected.primary,
    );
    expect(
      actual.onPrimary,
      expected.onPrimary,
    );
    expect(
      actual.secondary,
      expected.secondary,
    );
    expect(
      actual.onSecondary,
      expected.onSecondary,
    );
    expect(
      actual.error,
      expected.error,
    );
    expect(
      actual.onError,
      expected.onError,
    );
    expect(
      actual.surface,
      expected.surface,
    );
    expect(
      actual.onSurface,
      expected.onSurface,
    );
    expect(
      actual.surface,
      expected.surface,
    );
    expect(
      actual.onSurface,
      expected.onSurface,
    );
  });
}
