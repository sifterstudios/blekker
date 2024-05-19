// Copyright 2024 Sifterstudios

import 'package:appwrite/models.dart';
import 'package:blekker/app/error/exceptions.dart';
import 'package:blekker/app/error/failures.dart';
import 'package:blekker/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blekker/features/auth/data/repository/auth_repository_impl.dart';
import 'package:blekker/features/auth/domain/entities/session_entity.dart';
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
    MockSpec<DateTime>(as: #MockDateTime),
    MockSpec<Session>(as: #MockSession),
    MockSpec<SessionEntity>(as: #MockSessionEntity),
  ],
)
void main() {
  final authRemoteDataSource = MockAuthRemoteDataSource();
  final authRepository = AuthRepositoryImpl(authRemoteDataSource);
  final mockUser = MockUser();
  final mockUserEntity = MockUserEntity();
  final signupDummy = Either<Failure, UserEntity>.right(mockUserEntity);
  final mockSession = MockSession();
  final mockSessionEntity = MockSessionEntity();
  group('AuthRepositoryImpl', () {
    test('should return sessionEntity when loginWithEmailAndPassword is called',
        () async {
      // arrange

      final iso8601String = DateTime(2020).toIso8601String();

      when(
        mockSession.$createdAt,
      ).thenReturn(iso8601String);
      when(
        mockSession.expire,
      ).thenReturn(iso8601String);
      when(
        mockSession.providerAccessTokenExpiry,
      ).thenReturn(iso8601String);
      when(
        mockSession.mfaUpdatedAt,
      ).thenReturn(iso8601String);
      when(
        authRemoteDataSource.loginWithEmailAndPassword(
          email: 'email',
          password: 'password',
        ),
      ).thenAnswer((_) async => Future<Session>.value(mockSession));
      when(
        authRemoteDataSource.loginWithEmailAndPassword(
          email: 'email',
          password: 'password',
        ),
      ).thenAnswer((_) async => Future<Session>.value(mockSession));

      // act
      final result = await authRepository.loginWithEmailAndPassword(
        email: 'email',
        password: 'password',
      );

      // assert
      expect(result.isRight(), true);
    });
    test('should throw ServerException when trying to log in with empty fields',
        () async {
      // arrange
      when(
        authRemoteDataSource.loginWithEmailAndPassword(
          email: '',
          password: '',
        ),
      ).thenThrow(ServerException('LEFT'));

      // act
      try {
        await authRepository.loginWithEmailAndPassword(
          email: '',
          password: '',
        );
      } catch (e) {
        throwsA(ServerException('LEFT'));
      }
    });
    test('should pass RIGHT when sending correct arguments', () async {
      // arrange
      final iso8601String = DateTime(2020).toIso8601String();
      final myUser = User(
        $id: 'id',
        $createdAt: iso8601String,
        $updatedAt: iso8601String,
        name: 'John Doe',
        password: 'password',
        hash: 'hash',
        hashOptions: Map<dynamic, dynamic>(),
        registration: iso8601String,
        status: true,
        labels: List<dynamic>.empty(),
        passwordUpdate: iso8601String,
        email: 'john@doe.com',
        phone: '123456789',
        emailVerification: false,
        phoneVerification: false,
        mfa: false,
        prefs: Preferences(data: {}),
        targets: List<Target>.empty(),
        accessedAt: iso8601String,
      );
      provideDummy(signupDummy);
      when(
        mockUser.accessedAt,
      ).thenReturn(iso8601String);
      when(
        mockUser.passwordUpdate,
      ).thenReturn(iso8601String);
      when(
        mockUser.registration,
      ).thenReturn(iso8601String);
      when(
        mockUser.$createdAt,
      ).thenReturn(iso8601String);
      when(
        mockUser.$updatedAt,
      ).thenReturn(iso8601String);
      when(
        authRemoteDataSource.signupWithEmailAndPassword(
          name: 'name',
          email: 'email',
          password: 'password',
        ),
      ).thenAnswer((_) async => Future<User>.value(myUser));
      // act
      final result = await authRepository.signupWithEmailAndPassword(
        name: 'name',
        email: 'email',
        password: 'password',
      );

      // assert
      expect(result.isRight(), true);
      expect(result.getRight(), isA<Some<UserEntity>>());
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
