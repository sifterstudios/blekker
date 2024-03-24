// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/custom_theme/colors.dart';
import 'package:blekker/app/theme/theme.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    debugDefaultTargetPlatformOverride = null;
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets("Scaffold inherits theme's primaryContrastColor on iOS",
      (tester) async {
    const scaffoldBackgroundColor = BlekkerColors.primaryContrastColor;
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;

    // Arrange
    await tester.pumpWidget(
      MaterialApp(
        color: scaffoldBackgroundColor,
        localizationsDelegates: const [
          ...AppLocalizations.localizationsDelegates,
          AppLocalizations.delegate,
          DefaultMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        theme: BlekkerAppTheme.darkTheme,
        home: Scaffold(
          body: Center(
            child: Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Scaffold(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          body: const SizedBox(
                            width: 200,
                            height: 200,
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'SHOW',
                    style: Theme.of(context)
                        .cupertinoOverrideTheme!
                        .textTheme!
                        .navTitleTextStyle,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );

    // Act
    // check that text is of size 22
    expect(find.text('SHOW'), findsOneWidget);
    final text = tester.widget<Text>(find.text('SHOW'));
    expect(text.style!.fontSize, 22);

    await tester.tap(find.text('SHOW'));
    await tester.pump(const Duration(seconds: 1));

    // Assert
    expect(find.byType(Scaffold), findsNWidgets(2));
    final scaffolds =
        tester.widgetList<Scaffold>(find.byType(Scaffold)).toList();
    expect(scaffolds[1].backgroundColor, scaffoldBackgroundColor);

    // Cleanup
    debugDefaultTargetPlatformOverride = null;
  });

  // The rest of your tests go here
  testWidgets("Scaffold inherits theme's primaryContrastColor on android",
      (tester) async {
    const scaffoldBackgroundColor = BlekkerColors.primaryContrastColor;
    debugDefaultTargetPlatformOverride = TargetPlatform.android;

    // Arrange
    await tester.pumpWidget(
      PlatformApp(
        material: (_, __) => MaterialAppData(
          localizationsDelegates: [
            ...AppLocalizations.localizationsDelegates,
            AppLocalizations.delegate,
          ],
          theme: BlekkerAppTheme.darkTheme,
        ),
        home: PlatformScaffold(
          body: Center(
            child: Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return PlatformScaffold(
                          body: const SizedBox(
                            width: 200,
                            height: 200,
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('SHOW'),
                );
              },
            ),
          ),
        ),
      ),
    );

    // Act
    await tester.tap(find.text('SHOW'));
    await tester.pump(const Duration(seconds: 1));

    // Assert
    final materials =
        tester.widgetList<Material>(find.byType(Material)).toList();
    expect(materials.length, equals(2));
    expect(materials[0].color, scaffoldBackgroundColor); // app scaffold
    expect(materials[1].color, scaffoldBackgroundColor); // dialog scaffold

    // Cleanup
    debugDefaultTargetPlatformOverride = null;
  });

  testWidgets(
    'Input fields should have correct styling',
    (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        MaterialApp(
          theme: BlekkerAppTheme.darkTheme,
          home: Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      TextField(
                        key: const Key('username'),
                        style: Theme.of(context).textTheme.labelMedium,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
      // Act

      // Assert
      expect(find.byType(TextField), findsNWidgets(1));
      final inputDecorationTheme =
          Theme.of(widgetTester.element(find.byType(TextField)))
              .inputDecorationTheme;
      expect(inputDecorationTheme.contentPadding, const EdgeInsets.all(15));
      expect(
        inputDecorationTheme.enabledBorder,
        const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(
            color: BlekkerColors.secondaryLabelTextColor,
          ),
        ),
      );
    },
  );
}
