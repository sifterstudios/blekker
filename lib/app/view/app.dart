import 'package:blekker/app/theme/theme.dart';
import 'package:blekker/features/auth/presentation/pages/signup_page.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformProvider(
      builder: (context) => PlatformTheme(
        themeMode: ThemeMode.dark,
        materialLightTheme: BlekkerAppTheme.lightTheme,
        materialDarkTheme: BlekkerAppTheme.darkTheme,
        cupertinoLightTheme: MaterialBasedCupertinoThemeData(
          materialTheme: BlekkerAppTheme.lightTheme,
        ),
        cupertinoDarkTheme: MaterialBasedCupertinoThemeData(
          materialTheme: BlekkerAppTheme.darkTheme,
        ),
        builder: (context) => const PlatformApp(
          debugShowCheckedModeBanner: false,
          title: 'Blekker',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: SignupPage(),
        ),
      ),
    );
  }
}
