// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class maketripAdapter extends TypeAdapter<maketrip> {
  @override
  final int typeId = 1;

  @override
  maketrip read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return maketrip(
      name: fields[0] as dynamic,
      date: fields[1] as dynamic,
      displaydate: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, maketrip obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.displaydate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is maketripAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
