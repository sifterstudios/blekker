// Copyright 2024 Sifterstudios

import 'package:appwrite/models.dart';
import 'package:blekker/app/common/global_constants.dart';
import 'package:blekker/app/utils/equatable/equatable_date_time.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'session_entity.g.dart';

@HiveType(
  typeId: GlobalConstants.hiveTypeSessionEntity,
)
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
      providerAccessTokenExpiry: session.providerAccessTokenExpiry == ''
          ? null
          : EquatableDateTime(
              DateTime.parse(session.providerAccessTokenExpiry),
            ),
      providerRefreshToken: session.providerRefreshToken,
      ip: session.ip,
      current: session.current,
    );
  }

  @HiveField(0)
  final String id;
  @HiveField(1)
  final EquatableDateTime createdAt;
  @HiveField(2)
  final EquatableDateTime updatedAt;
  @HiveField(3)
  final String userId;
  @HiveField(4)
  final EquatableDateTime expire;
  @HiveField(5)
  final String provider;
  @HiveField(6)
  final String providerUid;
  @HiveField(7)
  final String providerAccessToken;
  @HiveField(8)
  final EquatableDateTime? providerAccessTokenExpiry;
  @HiveField(9)
  final String providerRefreshToken;
  @HiveField(10)
  final String ip;
  @HiveField(11)
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
