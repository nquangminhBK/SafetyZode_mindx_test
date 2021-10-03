// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FormAdapter extends TypeAdapter<Form> {
  @override
  final int typeId = 2;

  @override
  Form read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Form(
      formId: fields[0] as String,
      name: fields[1] as String,
      phone: fields[2] as String,
      cmnd: fields[3] as String,
      health: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Form obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.formId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.cmnd)
      ..writeByte(4)
      ..write(obj.health);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
