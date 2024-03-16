import 'package:appwrite/appwrite.dart';
import 'package:blekker/app/routes/go_routes.dart';
import 'package:blekker/app/theme/theme.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appwriteClient = Client();
    appwriteClient
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('65f481d37ef095af5cd9');
    return PlatformProvider(
      settings: PlatformSettingsData(
        iosUsesMaterialWidgets: true,
        iosUseZeroPaddingForAppbarPlatformIcon: true,
      ),
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
        builder: (context) => PlatformApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Blekker',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: BlekkerRoutes.router,
        ),
      ),
    );
  }
}
