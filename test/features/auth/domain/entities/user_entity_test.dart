// Copyright 2024 Sifterstudios

import 'package:appwrite/models.dart';
import 'package:blekker/app/utils/equatable/equatable_date_time.dart';
import 'package:blekker/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('user entity', () {
    User createUser() {
      const userDateTime = '2020-10-15T06:38:00.000Z';
      return User(
        $id: 'id',
        $createdAt: userDateTime,
        $updatedAt: userDateTime,
        name: 'John Doe',
        registration: userDateTime,
        status: true,
        labels: ['label'],
        passwordUpdate: userDateTime,
        email: 'some@email.com',
        phone: '1234567890',
        emailVerification: false,
        phoneVerification: false,
        mfa: false,
        prefs: Preferences(data: {}),
        targets: [],
        accessedAt: userDateTime,
      );
    }

    UserEntity createUserEntity() {
      return UserEntity(
        uid: 'id',
        createdAt:
            EquatableDateTime(DateTime.parse('2020-10-15T06:38:00.000+00:00')),
        updatedAt:
            EquatableDateTime(DateTime.parse('2020-10-15T06:38:00.000+00:00')),
        username: 'John Doe',
        registration:
            EquatableDateTime(DateTime.parse('2020-10-15T06:38:00.000+00:00')),
        activeStatus: true,
        labels: const ['label'],
        passwordUpdate:
            EquatableDateTime(DateTime.parse('2020-10-15T06:38:00.000+00:00')),
        email: 'some@email.com',
        phone: '1234567890',
        emailVerification: false,
        phoneVerification: false,
        prefs: const {},
        accessedAt:
            EquatableDateTime(DateTime.parse('2020-10-15T06:38:00.000+00:00')),
      );
    }

    test('maps correctly from user object', () {
      // arrange
      final input = createUser();
      final expected = createUserEntity();

      // act
      final result = UserEntity.fromUser(input);

      // assert
      expect(result.uid, expected.uid);
      expect(result.createdAt, expected.createdAt);
      expect(result.updatedAt, expected.updatedAt);
      expect(result.username, expected.username);
      expect(result.registration, expected.registration);
      expect(result.activeStatus, expected.activeStatus);
      expect(result.labels, expected.labels);
      expect(result.passwordUpdate, expected.passwordUpdate);
      expect(result.email, expected.email);
      expect(result.phone, expected.phone);
      expect(result.emailVerification, expected.emailVerification);
      expect(result.phoneVerification, expected.phoneVerification);
      expect(result.prefs, expected.prefs);
      expect(result.accessedAt, expected.accessedAt);
      expect(expected, equals(result));
    });
    test('maps correctly to User', () {
      // arrange
      final input = createUserEntity();
      final expected = createUser();

      // act
      final result = input.toUser();

      // assert
      expect(result.$id, expected.$id);
      expect(result.$createdAt, expected.$createdAt);
      expect(result.$updatedAt, expected.$updatedAt);
      expect(result.name, expected.name);
      expect(result.registration, expected.registration);
      expect(result.status, expected.status);
      expect(result.labels, expected.labels);
      expect(result.passwordUpdate, expected.passwordUpdate);
      expect(result.email, expected.email);
      expect(result.phone, expected.phone);
      expect(result.emailVerification, expected.emailVerification);
      expect(result.phoneVerification, expected.phoneVerification);
      expect(result.mfa, expected.mfa);
      // expect(result.prefs, expected.prefs);
      expect(result.targets, expected.targets);
      expect(result.accessedAt, expected.accessedAt);
      // expect(expected, equals(result));
    });
  });
}
