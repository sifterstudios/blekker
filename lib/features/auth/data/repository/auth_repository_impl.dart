// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/exceptions.dart';
import 'package:blekker/app/error/failures.dart';
import 'package:blekker/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blekker/features/auth/domain/entities/session_entity.dart';
import 'package:blekker/features/auth/domain/entities/user_entity.dart';
import 'package:blekker/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.remoteDataSource);

  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, SessionEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final session = await remoteDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(SessionEntity.fromSession(session));
    } on ServerException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signupWithEmailAndPassword(
        name: name,
        email: email,
        password: password,
      );

      return right(UserEntity.fromUser(userId));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
