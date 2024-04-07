// Copyright 2024 Sifterstudios

import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';

@immutable
class UserEntity {
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
      createdAt: DateTime.parse(user.$createdAt),
      updatedAt: DateTime.parse(user.$updatedAt),
      username: user.name,
      registration: DateTime.parse(user.registration),
      activeStatus: user.status,
      labels: user.labels,
      passwordUpdate: DateTime.parse(user.passwordUpdate),
      email: user.email,
      phone: user.phone,
      emailVerification: user.emailVerification,
      phoneVerification: user.phoneVerification,
      prefs: user.prefs.toMap(),
      accessedAt: DateTime.parse(user.accessedAt),
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
  final DateTime createdAt;
  final DateTime updatedAt;
  final String username;
  final DateTime registration;
  final bool activeStatus;
  final List<dynamic> labels;
  final DateTime passwordUpdate;
  final String email;
  final String phone;
  final bool emailVerification;
  final bool phoneVerification;
  final Map<String, dynamic> prefs;
  final DateTime accessedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          username == other.username &&
          registration == other.registration &&
          activeStatus == other.activeStatus &&
          labels == other.labels &&
          passwordUpdate == other.passwordUpdate &&
          email == other.email &&
          phone == other.phone &&
          emailVerification == other.emailVerification &&
          phoneVerification == other.phoneVerification &&
          prefs == other.prefs &&
          accessedAt == other.accessedAt);

  @override
  int get hashCode =>
      uid.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      username.hashCode ^
      registration.hashCode ^
      activeStatus.hashCode ^
      labels.hashCode ^
      passwordUpdate.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      emailVerification.hashCode ^
      phoneVerification.hashCode ^
      prefs.hashCode ^
      accessedAt.hashCode;

  @override
  String toString() {
    return 'SessionEntity{ '
        'uid: $uid, '
        'createdAt: $createdAt, '
        'updatedAt: $updatedAt, '
        'username: $username, '
        'registration: $registration, '
        'activeStatus: $activeStatus, '
        'labels: $labels, '
        'passwordUpdate: $passwordUpdate, '
        'email: $email, phone: $phone, '
        'emailVerification: $emailVerification, '
        'phoneVerification: $phoneVerification, '
        'prefs: $prefs, '
        'accessedAt: $accessedAt,}';
  }

  UserEntity copyWith({
    String? uid,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? username,
    DateTime? registration,
    bool? activeStatus,
    List<String>? labels,
    DateTime? passwordUpdate,
    String? email,
    String? phone,
    bool? emailVerification,
    bool? phoneVerification,
    Map<String, String>? prefs,
    DateTime? accessedAt,
  }) {
    return UserEntity(
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      username: username ?? this.username,
      registration: registration ?? this.registration,
      activeStatus: activeStatus ?? this.activeStatus,
      labels: labels ?? this.labels,
      passwordUpdate: passwordUpdate ?? this.passwordUpdate,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      emailVerification: emailVerification ?? this.emailVerification,
      phoneVerification: phoneVerification ?? this.phoneVerification,
      prefs: prefs ?? this.prefs,
      accessedAt: accessedAt ?? this.accessedAt,
    );
  }
//</editor-fold>
}
