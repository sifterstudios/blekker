// Copyright 2024 Sifterstudios

import 'package:appwrite/models.dart';
import 'package:blekker/app/utils/equatable/equatable_date_time.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class UserEntity extends Equatable {
//<editor-fold desc="Data Methods">
  const UserEntity({
    required this.uid,
    required this.createdAt,
    required this.updatedAt,
    required this.username,
    required this.registration,
    required this.activeStatus,
    required this.labels,
    required this.passwordUpdate,
    required this.email,
    required this.phone,
    required this.emailVerification,
    required this.phoneVerification,
    required this.prefs,
    required this.accessedAt,
  });

  factory UserEntity.fromUser(User user) {
    return UserEntity(
      uid: user.$id,
      createdAt: EquatableDateTime(DateTime.parse(user.$createdAt)),
      updatedAt: EquatableDateTime(DateTime.parse(user.$updatedAt)),
      username: user.name,
      registration: EquatableDateTime(DateTime.parse(user.registration)),
      activeStatus: user.status,
      labels: user.labels,
      passwordUpdate: EquatableDateTime(DateTime.parse(user.passwordUpdate)),
      email: user.email,
      phone: user.phone,
      emailVerification: user.emailVerification,
      phoneVerification: user.phoneVerification,
      prefs: user.prefs.data,
      accessedAt: EquatableDateTime(DateTime.parse(user.accessedAt)),
    );
  }

  User toUser() {
    return User(
      $id: uid,
      $createdAt: createdAt.toIso8601String(),
      $updatedAt: updatedAt.toIso8601String(),
      name: username,
      registration: registration.toIso8601String(),
      status: activeStatus,
      labels: labels,
      passwordUpdate: passwordUpdate.toIso8601String(),
      email: email,
      phone: phone,
      emailVerification: emailVerification,
      phoneVerification: phoneVerification,
      mfa: false,
      prefs: Preferences(data: prefs),
      targets: [],
      accessedAt: accessedAt.toIso8601String(),
    );
  }

  final String uid;
  final EquatableDateTime createdAt;
  final EquatableDateTime updatedAt;
  final String username;
  final EquatableDateTime registration;
  final bool activeStatus;
  final List<dynamic> labels;
  final EquatableDateTime passwordUpdate;
  final String email;
  final String phone;
  final bool emailVerification;
  final bool phoneVerification;
  final Map<String, dynamic> prefs;
  final EquatableDateTime accessedAt;

  @override
  List<Object?> get props {
    return [
      uid,
      createdAt,
      updatedAt,
      username,
      registration,
      activeStatus,
      labels,
      passwordUpdate,
      email,
      phone,
      emailVerification,
      phoneVerification,
      prefs,
      accessedAt,
    ];
  }
//</editor-fold>
}
