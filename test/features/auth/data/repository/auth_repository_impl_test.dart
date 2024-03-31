// Copyright 2024 Sifterstudios

import 'package:appwrite/models.dart';
import 'package:blekker/app/error/exceptions.dart';
import 'package:blekker/app/error/failures.dart';
import 'package:blekker/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blekker/features/auth/data/repository/auth_repository_impl.dart';
import 'package:blekker/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<AuthRemoteDataSource>(),
    MockSpec<User>(as: #MockUser),
    MockSpec<UserEntity>(as: #MockUserEntity),
  ],
)
void main() {
  final authRemoteDataSource = MockAuthRemoteDataSource();
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);
  final mockUser = MockUser();
  final mockUserEntity = MockUserEntity();
  final signupDummy = Either<Failure, UserEntity>.right(mockUserEntity);
  group('AuthRepositoryImpl', () {
    test('should throw unimplemented error when trying to log in', () async {
      // act
      try {
        await authRepository.loginWithEmailAndPassword(
          email: 'email',
          password: 'password',
        );
      } catch (e) {
        throwsA(UnimplementedError());
      }
    });
    test('should pass RIGHT when sending correct arguments', () async {
      // arrange
      provideDummy(signupDummy);
      when(
        authRemoteDataSource.signupWithEmailAndPassword(
          name: 'name',
          email: 'email',
          password: 'password',
        ),
      ).thenAnswer((_) async => Future<User>.value(mockUser));
      // act
      final result = await authRepository.signupWithEmailAndPassword(
        name: 'name',
        email: 'email',
        password: 'password',
      );

      // assert
      expect(result.isRight(), true);
      expect(result.getRight(), isA<UserEntity>());
    });
    test('should pass LEFT when sending incorrect arguments', () async {
      // arrange
      provideDummy(signupDummy);
      when(
        authRemoteDataSource.signupWithEmailAndPassword(
          name: '',
          email: '',
          password: '',
        ),
      ).thenThrow(ServerException('LEFT'));
      // act
      final result = await authRepository.signupWithEmailAndPassword(
        name: '',
        email: '',
        password: '',
      );
      final message = result.fold((l) => l.message, (r) => r);

      // assert
      expect(result.isLeft(), true);
      expect(message, 'LEFT');
      throwsA(isA<ServerException>());
    });
  });
}
