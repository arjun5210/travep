// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travelprice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class travelexpAdapter extends TypeAdapter<travelexp> {
  @override
  final int typeId = 7;

  @override
  travelexp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return travelexp(
      Destination: fields[0] as String,
      startingdate: fields[1] as String,
      price: fields[2] as String,
      mode: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, travelexp obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.Destination)
      ..writeByte(1)
      ..write(obj.startingdate)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.mode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is travelexpAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
