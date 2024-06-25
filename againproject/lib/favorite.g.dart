// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class favoritetripAdapter extends TypeAdapter<favoritetrip> {
  @override
  final int typeId = 3;

  @override
  favoritetrip read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return favoritetrip(
      destination: fields[0] as String,
      startdate: fields[1] as String,
      budget: fields[2] as String,
      desc: fields[3] as String,
      travelmode: fields[4] as String,
      enddate: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, favoritetrip obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.destination)
      ..writeByte(1)
      ..write(obj.startdate)
      ..writeByte(2)
      ..write(obj.budget)
      ..writeByte(3)
      ..write(obj.desc)
      ..writeByte(4)
      ..write(obj.travelmode)
      ..writeByte(5)
      ..write(obj.enddate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is favoritetripAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
