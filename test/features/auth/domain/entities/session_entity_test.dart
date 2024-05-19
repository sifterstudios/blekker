// Copyright 2024 Sifterstudios

import 'package:appwrite/models.dart';
import 'package:blekker/app/utils/equatable/equatable_date_time.dart';
import 'package:blekker/features/auth/domain/entities/session_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const id = '5e5ea5c16897e';
  const sessionDate = '2020-10-15T06:38:00.000+00:00';
  const userId = '5e5bb8c16897e';
  const provider = 'email';
  const providerUid = 'some@email.com';
  const providerAccessToken = 'MTQ0NjJkZmQ5OTM2NDE1ZTZjNGZmZjI4';
  const providerRefreshToken = 'MTQ0NjJkZmQ5OTM2NDE1ZTZjNGZmZjI3';
  const ip = '127.0.0.1';
  const current = true;

  group('SessionEntity', () {
    Session createSession() {
      return Session(
        $id: id,
        $createdAt: sessionDate,
        $updatedAt: sessionDate,
        userId: userId,
        expire: sessionDate,
        provider: provider,
        providerUid: providerUid,
        providerAccessToken: providerAccessToken,
        providerAccessTokenExpiry: sessionDate,
        providerRefreshToken: providerRefreshToken,
        ip: ip,
        osCode: '',
        osName: '',
        osVersion: '',
        clientType: '',
        clientCode: '',
        clientName: '',
        clientVersion: '',
        clientEngine: '',
        clientEngineVersion: '',
        deviceName: '',
        deviceBrand: '',
        deviceModel: '',
        countryCode: '',
        countryName: '',
        current: current,
        factors: [''],
        secret: '',
        mfaUpdatedAt: '',
      );
    }

    SessionEntity createSessionEntity() {
      return SessionEntity(
        id: id,
        createdAt: EquatableDateTime(DateTime.parse(sessionDate)),
        updatedAt: EquatableDateTime(DateTime.parse(sessionDate)),
        userId: userId,
        expire: EquatableDateTime(DateTime.parse(sessionDate)),
        provider: provider,
        providerUid: providerUid,
        providerAccessToken: providerAccessToken,
        providerAccessTokenExpiry:
            EquatableDateTime(DateTime.parse(sessionDate)),
        providerRefreshToken: providerRefreshToken,
        ip: ip,
        current: current,
      );
    }

    test('should map correctly from Session Object', () {
      // arrange
      final input = createSession();
      final expected = createSessionEntity();

      // act
      final result = SessionEntity.fromSession(input);

      // assert
      // expect the result to be a SessionEntity
      expect(result, isA<SessionEntity>());
      expect(result.id, expected.id);
      expect(result.createdAt, expected.createdAt);
      expect(result.userId, expected.userId);
      expect(result.expire, expected.expire);
      expect(result.provider, expected.provider);
      expect(result.providerUid, expected.providerUid);
      expect(result.providerAccessToken, expected.providerAccessToken);
      expect(
        result.providerAccessTokenExpiry,
        expected.providerAccessTokenExpiry,
      );
      expect(result.providerRefreshToken, expected.providerRefreshToken);
      expect(result.ip, expected.ip);
      expect(result.current, expected.current);
      expect(result, equals(expected));
    });
  });
}
