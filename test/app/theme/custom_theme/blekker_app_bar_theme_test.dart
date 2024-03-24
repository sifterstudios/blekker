// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/helpers.dart';

void main() {
  group('BlekkerAppBarTheme', () {
    testWidgets('renders app bar with blekkerAppBarTheme', (tester) async {
      await tester.pumpApp(
        Scaffold(
          appBar: AppBar(
            title: const Text('App Bar'),
          ),
        ),
      );

      final appBarThemeData =
          Theme.of(tester.element(find.byType(AppBar))).appBarTheme;

      expect(
        appBarThemeData.backgroundColor,
        BlekkerColors.backgroundColor,
      );
      expect(
        appBarThemeData.centerTitle,
        false,
      );
    });
  });
}
