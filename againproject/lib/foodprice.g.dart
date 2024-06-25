// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foodprice.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class foodAdapter extends TypeAdapter<food> {
  @override
  final int typeId = 5;

  @override
  food read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return food(
      Destination: fields[0] as String,
      startingdate: fields[1] as String,
      foodtype: fields[2] as String,
      price: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, food obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.Destination)
      ..writeByte(1)
      ..write(obj.startingdate)
      ..writeByte(2)
      ..write(obj.foodtype)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is foodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
