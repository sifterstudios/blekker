// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:blekker/app/theme/custom_theme/input_decoration_theme.dart';
import 'package:blekker/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("InputDecorationTheme's enabledBorder and focusedBorder match",
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
    final inputDecorationTheme =
        Theme.of(tester.element(find.byType(TextFormField)))
            .inputDecorationTheme;
    expect(
      inputDecorationTheme.enabledBorder!.borderSide.color,
      BlekkerColors.secondaryLabelTextColor,
    );
    expect(
      inputDecorationTheme.focusedBorder!.borderSide.color,
      BlekkerColors.primaryColor,
    );
  });

  test('Constructing input decoration theme works with optional parameter', () {
// Arrange
    final inputDecorationTheme =
        BlekkerInputDecorationTheme.inputDecorationTheme;

    // Assert
    expect(
      inputDecorationTheme.enabledBorder!.borderSide.color,
      BlekkerColors.secondaryLabelTextColor,
    );
    expect(
      inputDecorationTheme.focusedBorder!.borderSide.color,
      BlekkerColors.primaryColor,
    );
  });
}
