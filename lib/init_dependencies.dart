// Copyright 2024 Sifterstudios

import 'package:appwrite/appwrite.dart';
import 'package:blekker/app/common/global_constants.dart';
import 'package:blekker/app/env/env.dart';
import 'package:blekker/app/utils/equatable/equatable_date_time.dart';
import 'package:blekker/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blekker/features/auth/data/repository/auth_repository_impl.dart';
import 'package:blekker/features/auth/domain/entities/session_entity.dart';
import 'package:blekker/features/auth/domain/repository/auth_repository.dart';
import 'package:blekker/features/auth/domain/usecases/user_login.dart';
import 'package:blekker/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blekker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies({bool testing = false}) async {
  _initAuth();
  _initAppwrite();
  if (!testing) {
    await _initHive();
  }
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(SessionEntityAdapter())
    ..registerAdapter(EquatableDateTimeAdapter());
  await Hive.openBox<SessionEntity>(GlobalConstants.hiveSessionEntityBox);
}

void _initAppwrite() {
  final appwriteClient = Client();
  appwriteClient
      .setEndpoint(Env.APPWRITE_ENDPOINT)
      .setProject(Env.APPWRITE_PROJECT_ID);

  serviceLocator
    ..registerLazySingleton(() => appwriteClient)
    ..registerLazySingleton<Logger>(serviceLocator.call);
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        client: serviceLocator(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignup(
        authRepository: serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogin(
        authRepository: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBloc(
        userSignup: serviceLocator(),
        userLogin: serviceLocator(),
      ),
    );
}
