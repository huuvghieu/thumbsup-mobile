// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as int,
      productName: fields[1] as String,
      originalPrice: fields[2] as double,
      salePrice: fields[3] as double,
      discount: fields[4] as int,
      shelfLife: fields[5] as int?,
      weight: fields[6] as double?,
      rating: fields[7] as int?,
      quantity: fields[8] as int,
      numOfRating: fields[9] as int?,
      description: fields[10] as String?,
      favor: fields[11] as bool?,
      state: fields[12] as bool?,
      storeId: fields[13] as int,
      storeName: fields[14] as String?,
      categoryId: fields[15] as int,
      categoryName: fields[16] as String?,
      brandId: fields[17] as int,
      brandName: fields[18] as String?,
      countryId: fields[19] as int,
      countryName: fields[20] as String?,
      imageCover: fields[21] as String?,
      status: fields[22] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.originalPrice)
      ..writeByte(3)
      ..write(obj.salePrice)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.shelfLife)
      ..writeByte(6)
      ..write(obj.weight)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.quantity)
      ..writeByte(9)
      ..write(obj.numOfRating)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.favor)
      ..writeByte(12)
      ..write(obj.state)
      ..writeByte(13)
      ..write(obj.storeId)
      ..writeByte(14)
      ..write(obj.storeName)
      ..writeByte(15)
      ..write(obj.categoryId)
      ..writeByte(16)
      ..write(obj.categoryName)
      ..writeByte(17)
      ..write(obj.brandId)
      ..writeByte(18)
      ..write(obj.brandName)
      ..writeByte(19)
      ..write(obj.countryId)
      ..writeByte(20)
      ..write(obj.countryName)
      ..writeByte(21)
      ..write(obj.imageCover)
      ..writeByte(22)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
