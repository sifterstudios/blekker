// Copyright 2024 Sifterstudios

import 'package:blekker/app/routes/go_routes.dart';
import 'package:blekker/app/theme/theme.dart';
import 'package:blekker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blekker/init_dependencies.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    initDependencies();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: PlatformProvider(
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
            routerConfig: router(),
          ),
        ),
      ),
    );
  }
}
