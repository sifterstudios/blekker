// Copyright 2024 Sifterstudios
import 'package:blekker/app/common/global_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'equatable_date_time.g.dart';

@HiveType(typeId: GlobalConstants.hiveTypeEquatableDateTime)
@immutable
class EquatableDateTime extends Equatable {
  const EquatableDateTime(this.dateTime);

  @HiveField(0)
  final DateTime dateTime;

  @override
  List<Object?> get props => [dateTime];

  String toIso8601String() {
    return dateTime.toIso8601String();
  }
}
