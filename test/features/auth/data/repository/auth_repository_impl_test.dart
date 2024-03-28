// Copyright 2024 Sifterstudios

import 'package:blekker/app/error/exceptions.dart';
import 'package:blekker/app/error/failures.dart';
import 'package:blekker/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blekker/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<AuthRemoteDataSource>()])
void main() {
  final authRemoteDataSource = MockAuthRemoteDataSource();
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);
  final signupFailureDummy = Either<Failure, String>.left(Failure('LEFT'));
  final signupDummy = Either<Failure, String>.right('success');
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
      ).thenAnswer((_) async => Future<String>.value('success'));
      // act
      final result = await authRepository.signupWithEmailAndPassword(
        name: 'name',
        email: 'email',
        password: 'password',
      );

      // assert
      expect(result.isRight(), true);
      expect(result.getRight(), const Some<String>('success'));
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
