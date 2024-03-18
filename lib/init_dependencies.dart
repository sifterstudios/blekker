import 'package:appwrite/appwrite.dart';
import 'package:blekker/app/env/env.dart';
import 'package:blekker/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blekker/features/auth/data/repository/auth_repository_impl.dart';
import 'package:blekker/features/auth/domain/repository/auth_repository.dart';
import 'package:blekker/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blekker/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final appwriteClient = Client();
  appwriteClient
      .setEndpoint(Env.APPWRITE_ENDPOINT)
      .setProject(Env.APPWRITE_PROJECT_ID);

  serviceLocator.registerLazySingleton(() => appwriteClient);
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
    ..registerLazySingleton(
      () => AuthBloc(
        userSignup: serviceLocator(),
      ),
    );
}
