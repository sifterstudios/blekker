// Copyright 2024 Sifterstudios
import 'package:blekker/app/routes/go_routes.dart';
import 'package:blekker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blekker/init_dependencies.dart';
import 'package:blekker/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

extension PumpRouterApp on WidgetTester {
  String getRouterKey(String route) {
    return 'key_$route';
  }

  Future<void> pumpRouterApp(Widget widget) async {
    const initialLocation = '/_initial';

    final r = GoRouter(
      debugLogDiagnostics: true,
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          path: initialLocation,
          builder: (context, state) => widget,
        ),
        ...Routes().props.map(
              (e) => GoRoute(
                path: e! as String,
                builder: (context, state) => Container(
                  key: Key(
                    getRouterKey(e as String),
                  ),
                ),
              ),
            ),
      ],
    );

    await serviceLocator.reset();
    await initDependencies();
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
          routerConfig: r,
          // routeInformationParser: r.routeInformationParser,
          // routerDelegate: r.routerDelegate,
        ),
      ),
    );
  }
}
