// Copyright 2024 Sifterstudios

import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';

@immutable
class SessionEntity {
//<editor-fold desc="Data Methods">
  const SessionEntity({
    required this.id,
    required this.createdAt,
    required this.userId,
    required this.expire,
    required this.provider,
    required this.providerUid,
    required this.providerAccessToken,
    required this.providerAccessTokenExpiry,
    required this.providerRefreshToken,
    required this.ip,
    required this.osCode,
    required this.osName,
    required this.osVersion,
    required this.clientType,
    required this.clientCode,
    required this.clientName,
    required this.clientVersion,
    required this.clientEngine,
    required this.clientEngineVersion,
    required this.deviceName,
    required this.deviceBrand,
    required this.deviceModel,
    required this.countryCode,
    required this.countryName,
    required this.current,
  });

  factory SessionEntity.fromSession(Session session) {
    return SessionEntity(
      id: session.$id,
      createdAt: session.$createdAt,
      userId: session.userId,
      expire: session.expire,
      provider: session.provider,
      providerUid: session.providerUid,
      providerAccessToken: session.providerAccessToken,
      providerAccessTokenExpiry: session.providerAccessTokenExpiry,
      providerRefreshToken: session.providerRefreshToken,
      ip: session.ip,
      osCode: session.osCode,
      osName: session.osName,
      osVersion: session.osVersion,
      clientType: session.clientType,
      clientCode: session.clientCode,
      clientName: session.clientName,
      clientVersion: session.clientVersion,
      clientEngine: session.clientEngine,
      clientEngineVersion: session.clientEngineVersion,
      deviceName: session.deviceName,
      deviceBrand: session.deviceBrand,
      deviceModel: session.deviceModel,
      countryCode: session.countryCode,
      countryName: session.countryName,
      current: session.current,
    );
  }

  final String id;
  final String createdAt;
  final String userId;
  final String expire;
  final String provider;
  final String providerUid;
  final String providerAccessToken;
  final String providerAccessTokenExpiry;
  final String providerRefreshToken;
  final String ip;
  final String osCode;
  final String osName;
  final String osVersion;
  final String clientType;
  final String clientCode;
  final String clientName;
  final String clientVersion;
  final String clientEngine;
  final String clientEngineVersion;
  final String deviceName;
  final String deviceBrand;
  final String deviceModel;
  final String countryCode;
  final String countryName;
  final bool current;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SessionEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          createdAt == other.createdAt &&
          userId == other.userId &&
          expire == other.expire &&
          provider == other.provider &&
          providerUid == other.providerUid &&
          providerAccessToken == other.providerAccessToken &&
          providerAccessTokenExpiry == other.providerAccessTokenExpiry &&
          providerRefreshToken == other.providerRefreshToken &&
          ip == other.ip &&
          osCode == other.osCode &&
          osName == other.osName &&
          osVersion == other.osVersion &&
          clientType == other.clientType &&
          clientCode == other.clientCode &&
          clientName == other.clientName &&
          clientVersion == other.clientVersion &&
          clientEngine == other.clientEngine &&
          clientEngineVersion == other.clientEngineVersion &&
          deviceName == other.deviceName &&
          deviceBrand == other.deviceBrand &&
          deviceModel == other.deviceModel &&
          countryCode == other.countryCode &&
          countryName == other.countryName &&
          current == other.current);

  @override
  int get hashCode =>
      id.hashCode ^
      createdAt.hashCode ^
      userId.hashCode ^
      expire.hashCode ^
      provider.hashCode ^
      providerUid.hashCode ^
      providerAccessToken.hashCode ^
      providerAccessTokenExpiry.hashCode ^
      providerRefreshToken.hashCode ^
      ip.hashCode ^
      osCode.hashCode ^
      osName.hashCode ^
      osVersion.hashCode ^
      clientType.hashCode ^
      clientCode.hashCode ^
      clientName.hashCode ^
      clientVersion.hashCode ^
      clientEngine.hashCode ^
      clientEngineVersion.hashCode ^
      deviceName.hashCode ^
      deviceBrand.hashCode ^
      deviceModel.hashCode ^
      countryCode.hashCode ^
      countryName.hashCode ^
      current.hashCode;

  @override
  String toString() {
    return 'SessionEntity{ '
        'id: $id, '
        'createdAt: $createdAt, '
        'userId: $userId, '
        'expire: $expire, '
        'provider: $provider, '
        'providerUid: $providerUid, '
        'providerAccessToken: $providerAccessToken, '
        'providerAccessTokenExpiry: $providerAccessTokenExpiry, '
        'providerRefreshToken: $providerRefreshToken, '
        'ip: $ip, '
        'osCode: $osCode, '
        'osName: $osName, '
        'osVersion: $osVersion, '
        'clientType: $clientType, '
        'clientCode: $clientCode, '
        'clientName: $clientName, '
        'clientVersion: $clientVersion, '
        'clientEngine: $clientEngine, '
        'clientEngineVersion: $clientEngineVersion, '
        'deviceName: $deviceName, '
        'deviceBrand: $deviceBrand, '
        'deviceModel: $deviceModel, '
        'countryCode: $countryCode, '
        'countryName: $countryName, '
        'current: $current,}';
  }

  SessionEntity copyWith({
    String? $id,
    String? $createdAt,
    String? userId,
    String? expire,
    String? provider,
    String? providerUid,
    String? providerAccessToken,
    String? providerAccessTokenExpiry,
    String? providerRefreshToken,
    String? ip,
    String? osCode,
    String? osName,
    String? osVersion,
    String? clientType,
    String? clientCode,
    String? clientName,
    String? clientVersion,
    String? clientEngine,
    String? clientEngineVersion,
    String? deviceName,
    String? deviceBrand,
    String? deviceModel,
    String? countryCode,
    String? countryName,
    bool? current,
  }) {
    return SessionEntity(
      id: $id ?? id,
      createdAt: $createdAt ?? createdAt,
      userId: userId ?? this.userId,
      expire: expire ?? this.expire,
      provider: provider ?? this.provider,
      providerUid: providerUid ?? this.providerUid,
      providerAccessToken: providerAccessToken ?? this.providerAccessToken,
      providerAccessTokenExpiry:
          providerAccessTokenExpiry ?? this.providerAccessTokenExpiry,
      providerRefreshToken: providerRefreshToken ?? this.providerRefreshToken,
      ip: ip ?? this.ip,
      osCode: osCode ?? this.osCode,
      osName: osName ?? this.osName,
      osVersion: osVersion ?? this.osVersion,
      clientType: clientType ?? this.clientType,
      clientCode: clientCode ?? this.clientCode,
      clientName: clientName ?? this.clientName,
      clientVersion: clientVersion ?? this.clientVersion,
      clientEngine: clientEngine ?? this.clientEngine,
      clientEngineVersion: clientEngineVersion ?? this.clientEngineVersion,
      deviceName: deviceName ?? this.deviceName,
      deviceBrand: deviceBrand ?? this.deviceBrand,
      deviceModel: deviceModel ?? this.deviceModel,
      countryCode: countryCode ?? this.countryCode,
      countryName: countryName ?? this.countryName,
      current: current ?? this.current,
    );
  }

//</editor-fold>
}
