// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mebel_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MebelAdapter extends TypeAdapter<MebelModel> {
  @override
  final int typeId = 0;

  @override
  MebelModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MebelModel(
      article: fields[0] as String,
      name: fields[1] as String,
      category: fields[2] as String,
      description: fields[3] as String,
      price: fields[4] == null ? 0 : fields[4] as double,
      count: fields[5] == null ? 0 : fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MebelModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.article)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MebelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
