// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/failures.dart';
import 'package:blekker/features/auth/domain/entities/session_entity.dart';
import 'package:blekker/features/auth/domain/entities/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> signupWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, SessionEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
