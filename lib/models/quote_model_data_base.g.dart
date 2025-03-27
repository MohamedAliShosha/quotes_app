// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model_data_base.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataBaseQuoteModelAdapter extends TypeAdapter<DataBaseQuoteModel> {
  @override
  final int typeId = 0;

  @override
  DataBaseQuoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataBaseQuoteModel(
      quote: fields[0] as String,
      author: fields[1] as String,
      date: fields[2] as String,
      color: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DataBaseQuoteModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.quote)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataBaseQuoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
