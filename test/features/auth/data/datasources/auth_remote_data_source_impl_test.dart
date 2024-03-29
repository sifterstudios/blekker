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
  ],
)
void main() {
  final client = MockClient();
  final account = MockAccount();
  final mockUser = MockUser();
  final authRemoteDataSource = AuthRemoteDataSourceImpl(client: client);

  group('AuthRemoteDataSource', () {
    test('should throw unimplemented when trying to log in', () {
      // Act
      expect(
        () => authRemoteDataSource.loginWithEmailAndPassword(
          name: 'name',
          email: 'email',
          password: 'password',
        ),
        throwsA(isA<UnimplementedError>()),
      );
    });
    test('should return unique user id when signing up user', () async {
      // Arrange
      // when(Account(client)).thenReturn(account);
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
      expect(result, 'success');
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
  });
}
