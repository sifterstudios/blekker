// Copyright 2024 Sifterstudios

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:blekker/app/error/exceptions.dart';
import 'package:blekker/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_remote_data_source_impl_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<Account>(),
    MockSpec<Client>(),
    MockSpec<User>(as: #MockUser),
    MockSpec<Session>(as: #MockSession),
  ],
)
void main() {
  final client = MockClient();
  final account = MockAccount();
  final mockUser = MockUser();
  final mockSession = MockSession();
  final authRemoteDataSource = AuthRemoteDataSourceImpl(client: client);

  group('AuthRemoteDataSource', () {
    test(
        'should return SessionEntity when logging in '
        'with credentials', () async {
      // Arrange
      when(
        account.createEmailPasswordSession(
          email: 'email',
          password: 'password',
        ),
      ).thenAnswer((_) async => Future<Session>.value(mockSession));

      when(mockSession.providerAccessToken).thenReturn('success');

      // Act
      final result = await authRemoteDataSource.loginWithEmailAndPassword(
        email: 'email',
        password: 'password',
        account: account,
      );

      // Assert
      expect(result, mockSession);
      expect(result.providerAccessToken, 'success');
    });
    test('should return unique user id when signing up user', () async {
      // Arrange
      final userId = ID.unique();
      when(
        account.create(
          userId: userId,
          email: 'email',
          password: 'password',
          name: 'name',
        ),
      ).thenAnswer((_) async => Future<User>.value(mockUser));

      when(mockUser.$id).thenReturn('success');

      // Act
      final result = await authRemoteDataSource.signupWithEmailAndPassword(
        userId: userId,
        email: 'email',
        password: 'password',
        name: 'name',
        account: account,
      );

      // Assert
      expect(result, mockUser);
    });
    test('should throw ServerException when signing up with missing fields',
        () async {
      // Arrange
      final userId = ID.unique();
      when(
        account.create(
          userId: userId,
          name: '',
          email: '',
          password: '',
        ),
      ).thenAnswer(
        (_) async => throw ServerException('Please fill in all fields'),
      );
      // Act
      try {
        await authRemoteDataSource.signupWithEmailAndPassword(
          name: '',
          email: '',
          password: '',
        );
      } catch (e) {
        // Assert
        throwsA(ServerException('Please fill in all fields'));
      }
      resetMockitoState();
    });
    test('should create a new Account when none is provided', () async {
      // Arrange
      final localAuthRemoteDataSource =
          AuthRemoteDataSourceImpl(client: client);

      when(
        account.createEmailPasswordSession(
          email: 'email',
          password: 'password',
        ),
      ).thenAnswer((_) async => Future<Session>.value(mockSession));

      when(mockSession.providerAccessToken).thenReturn('success');
      // Act
      try {
        await localAuthRemoteDataSource.loginWithEmailAndPassword(
          email: '',
          password: '',
        );
      } catch (e) {
        // Assert
        throwsA(ServerException('Please fill in all fields'));
      }
      resetMockitoState();
    });
  });
}
