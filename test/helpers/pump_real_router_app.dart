// Copyright 2024 Sifterstudios

import 'package:blekker/app/routes/go_routes.dart';
import 'package:blekker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blekker/init_dependencies.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpRealRouterApp on WidgetTester {
  Future<void> pumpRealRouterApp({
    required String location,
    required Widget Function(Widget child) builder,
    bool isConnected = true,
  }) async {
    await serviceLocator.reset();
    await initDependencies(testing: true);
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => serviceLocator<AuthBloc>(),
          ),
        ],
        child: PlatformApp.router(
          title: 'Blekker',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: router(location),
        ),
      ),
    );
  }
}
