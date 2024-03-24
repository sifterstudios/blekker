// Copyright 2024 Sifterstudios

import 'package:blekker/app/theme/theme.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      PlatformApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        material: (_, __) => MaterialAppData(theme: BlekkerAppTheme.darkTheme),
        cupertino: (_, __) => CupertinoAppData(
          theme: MaterialBasedCupertinoThemeData(
            materialTheme: BlekkerAppTheme.darkTheme,
          ),
        ),
        home: Scaffold(body: widget),
      ),
    );
  }
}
