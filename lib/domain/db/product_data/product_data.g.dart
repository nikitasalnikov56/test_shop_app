// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDataAdapter extends TypeAdapter<ProductData> {
  @override
  final int typeId = 1;

  @override
  ProductData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductData(
      title: fields[0] as String?,
      description: fields[1] as String?,
      image: fields[2] as String?,
      rate: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, ProductData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
