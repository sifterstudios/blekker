// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionEntityAdapter extends TypeAdapter<SessionEntity> {
  @override
  final int typeId = 1;

  @override
  SessionEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionEntity(
      id: fields[0] as String,
      createdAt: fields[1] as EquatableDateTime,
      updatedAt: fields[2] as EquatableDateTime,
      userId: fields[3] as String,
      expire: fields[4] as EquatableDateTime,
      provider: fields[5] as String,
      providerUid: fields[6] as String,
      providerAccessToken: fields[7] as String,
      providerAccessTokenExpiry: fields[8] as EquatableDateTime?,
      providerRefreshToken: fields[9] as String,
      ip: fields[10] as String,
      current: fields[11] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SessionEntity obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.expire)
      ..writeByte(5)
      ..write(obj.provider)
      ..writeByte(6)
      ..write(obj.providerUid)
      ..writeByte(7)
      ..write(obj.providerAccessToken)
      ..writeByte(8)
      ..write(obj.providerAccessTokenExpiry)
      ..writeByte(9)
      ..write(obj.providerRefreshToken)
      ..writeByte(10)
      ..write(obj.ip)
      ..writeByte(11)
      ..write(obj.current);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
