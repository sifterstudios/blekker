// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/action_icon_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BlekkerActionIconTheme', () {
    testWidgets('renders icons', (tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return MaterialApp(
              home: Column(
                children: [
                  BlekkerActionIconTheme.backButton(context),
                  BlekkerActionIconTheme.closeButton(context),
                  BlekkerActionIconTheme.drawerButton(context),
                  BlekkerActionIconTheme.endDrawerButton(context),
                ],
              ),
            );
          },
        ),
      );
      expect(find.byIcon(Icons.arrow_back_sharp), findsOneWidget);
      expect(find.byIcon(Icons.close_sharp), findsOneWidget);
      expect(find.byIcon(Icons.menu_sharp), findsOneWidget);
      expect(find.byIcon(Icons.exit_to_app_sharp), findsOneWidget);
    });
  });
}
