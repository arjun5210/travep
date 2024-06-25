// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stayprice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class stayexpAdapter extends TypeAdapter<stayexp> {
  @override
  final int typeId = 8;

  @override
  stayexp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return stayexp(
      Destination: fields[0] as String,
      startingdate: fields[1] as String,
      price: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, stayexp obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.Destination)
      ..writeByte(1)
      ..write(obj.startingdate)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is stayexpAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
