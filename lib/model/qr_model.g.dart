// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QrModelAdapter extends TypeAdapter<QrModel> {
  @override
  final int typeId = 1;

  @override
  QrModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QrModel(
      id: fields[0] as String,
      barcode: fields[2] as String?,
      time: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, QrModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.barcode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QrModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
