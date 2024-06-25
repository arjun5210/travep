// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imediatelygoing.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class imeongoingAdapter extends TypeAdapter<imeongoing> {
  @override
  final int typeId = 6;

  @override
  imeongoing read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return imeongoing(
      Destination: fields[0] as String,
      startingdate: fields[1] as String,
      endingdate: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, imeongoing obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.Destination)
      ..writeByte(1)
      ..write(obj.startingdate)
      ..writeByte(2)
      ..write(obj.endingdate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is imeongoingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
