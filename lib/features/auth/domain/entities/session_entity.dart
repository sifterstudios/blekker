// Copyright 2024 Sifterstudios

import 'package:appwrite/models.dart';
import 'package:blekker/app/utils/equatable/equatable_date_time.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class SessionEntity extends Equatable {
//<editor-fold desc="Data Methods">
  const SessionEntity({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.expire,
    required this.provider,
    required this.providerUid,
    required this.providerAccessToken,
    required this.providerAccessTokenExpiry,
    required this.providerRefreshToken,
    required this.ip,
    required this.current,
  });

  factory SessionEntity.fromSession(Session session) {
    return SessionEntity(
      id: session.$id,
      createdAt: EquatableDateTime(DateTime.parse(session.$createdAt)),
      updatedAt: EquatableDateTime(DateTime.parse(session.$updatedAt)),
      userId: session.userId,
      expire: EquatableDateTime(DateTime.parse(session.expire)),
      provider: session.provider,
      providerUid: session.providerUid,
      providerAccessToken: session.providerAccessToken,
      providerAccessTokenExpiry:
          EquatableDateTime(DateTime.parse(session.providerAccessTokenExpiry)),
      providerRefreshToken: session.providerRefreshToken,
      ip: session.ip,
      current: session.current,
    );
  }

  final String id;
  final EquatableDateTime createdAt;
  final EquatableDateTime updatedAt;
  final String userId;
  final EquatableDateTime expire;
  final String provider;
  final String providerUid;
  final String providerAccessToken;
  final EquatableDateTime providerAccessTokenExpiry;
  final String providerRefreshToken;
  final String ip;
  final bool current;

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      userId,
      expire,
      provider,
      providerUid,
      providerAccessToken,
      providerAccessTokenExpiry,
      providerRefreshToken,
      ip,
      current,
    ];
  }

//</editor-fold>
}
