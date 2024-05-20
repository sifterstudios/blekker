// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/failures.dart';
import 'package:blekker/app/usecase/usecase.dart';
import 'package:blekker/features/auth/domain/entities/session_entity.dart';
import 'package:blekker/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserLogin implements UseCase<SessionEntity, UserLoginParams> {
  UserLogin({required this.authRepository});

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, SessionEntity>> call(UserLoginParams params) {
    return authRepository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  UserLoginParams({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
