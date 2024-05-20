// Copyright 2024 Sifterstudios

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equatable_date_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EquatableDateTimeAdapter extends TypeAdapter<EquatableDateTime> {
  @override
  final int typeId = 2;

  @override
  EquatableDateTime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EquatableDateTime(
      fields[0] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, EquatableDateTime obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EquatableDateTimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
