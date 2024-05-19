// Copyright 2024 Sifterstudios
import 'package:equatable/equatable.dart';

class EquatableDateTime extends Equatable {
  const EquatableDateTime(this.dateTime);

  final DateTime dateTime;

  @override
  List<Object?> get props => [dateTime];

  String toIso8601String() {
    return dateTime.toIso8601String();
  }
}
