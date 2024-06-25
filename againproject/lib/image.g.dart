// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class tripimagesAdapter extends TypeAdapter<tripimages> {
  @override
  final int typeId = 4;

  @override
  tripimages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return tripimages(
      exp: fields[0] as String?,
      nameimage: fields[1] as Uint8List,
      destination: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, tripimages obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.exp)
      ..writeByte(1)
      ..write(obj.nameimage)
      ..writeByte(2)
      ..write(obj.destination);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is tripimagesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
