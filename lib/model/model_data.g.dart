// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 1;

  @override
  BookModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookModel(
      judul: fields[0] as String,
      gambar: fields[1] as String,
      penulis: fields[2] as String,
      genre: fields[3] as String,
      tahunTerbit: fields[4] as String,
      penerbit: fields[5] as String,
      warna: fields[6] as int,
      notes: (fields[7] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.judul)
      ..writeByte(1)
      ..write(obj.gambar)
      ..writeByte(2)
      ..write(obj.penulis)
      ..writeByte(3)
      ..write(obj.genre)
      ..writeByte(4)
      ..write(obj.tahunTerbit)
      ..writeByte(5)
      ..write(obj.penerbit)
      ..writeByte(6)
      ..write(obj.warna)
      ..writeByte(7)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
