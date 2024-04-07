// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/failures.dart';
import 'package:blekker/app/usecase/usecase.dart';
import 'package:blekker/features/auth/domain/entities/session_entity.dart';
import 'package:blekker/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserInitDatabase implements UseCase<SessionEntity, UserDatabaseParams> {
  UserInitDatabase({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, SessionEntity>> call(UserDatabaseParams params) async {
    final result = await authRepository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );

    return result.fold(handleFailure, handleSession);
  }

  Failure handleFailure(Failure l) => l;

  SessionEntity handleSession(SessionEntity r) => r;
}

class UserDatabaseParams {
  UserDatabaseParams({
    required this.password,
    required this.email,
  });

  final String password;
  final String email;
}
