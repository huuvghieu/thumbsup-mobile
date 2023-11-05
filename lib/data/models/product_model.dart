import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final double originalPrice;
  @HiveField(3)
  final double salePrice;
  @HiveField(4)
  final int discount;
  @HiveField(5)
  int? shelfLife;
  @HiveField(6)
  double? weight;
  @HiveField(7)
  int? rating;
  @HiveField(8)
  late int quantity;
  @HiveField(9)
  int? numOfRating;
  @HiveField(10)
  String? description;
  @HiveField(11)
  bool? favor;
  @HiveField(12)
  bool? state;
  @HiveField(13)
  final int storeId;
  @HiveField(14)
  String? storeName;
  @HiveField(15)
  final int categoryId;
  @HiveField(16)
  String? categoryName;
  @HiveField(17)
  final int brandId;
  @HiveField(18)
  String? brandName;
  @HiveField(19)
  final int countryId;
  @HiveField(20)
  String? countryName;
  @HiveField(21)
  String? imageCover;
  @HiveField(22)
  bool? status;

  ProductModel(
      {required this.id,
      required this.productName,
      required this.originalPrice,
      required this.salePrice,
      required this.discount,
      this.shelfLife,
      this.weight,
      this.rating,
      required this.quantity,
      this.numOfRating,
      this.description,
      this.favor,
      this.state,
      required this.storeId,
      this.storeName,
      required this.categoryId,
      this.categoryName,
      required this.brandId,
      this.brandName,
      required this.countryId,
      this.countryName,
      this.imageCover,
      this.status});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      productName: json['productName'],
      originalPrice: (json['originalPrice'] as num).toDouble(),
      salePrice: (json['salePrice'] as num).toDouble(),
      discount: (json['discount'] as num).toInt(),
      shelfLife: (json['shelfLife'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      rating: (json['rating'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      numOfRating: (json['numOfRating'] as num).toInt(),
      description: json['description'],
      favor: json['favor'],
      state: json['state'],
      storeId: json['storeId'],
      storeName: json['storeName'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      brandId: json['brandId'],
      brandName: json['brandName'],
      countryId: json['countryId'],
      countryName: json['countryName'],
      imageCover: json['imageCover'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['productName'] = productName;
    data['originalPrice'] = originalPrice;
    data['salePrice'] = salePrice;
    data['discount'] = discount;
    data['shelfLife'] = shelfLife;
    data['weight'] = weight;
    data['rating'] = rating;
    data['quantity'] = quantity;
    data['numOfRating'] = numOfRating;
    data['description'] = description;
    data['favor'] = favor;
    data['state'] = state;
    data['storeId'] = storeId;
    data['storeName'] = storeName;
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['brandId'] = brandId;
    data['brandName'] = brandName;
    data['countryId'] = countryId;
    data['countryName'] = countryName;
    data['imageCover'] = imageCover;
    data['status'] = status;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        productName,
        originalPrice,
        salePrice,
        discount,
        weight,
        rating,
        quantity,
        numOfRating,
        description,
        favor,
        state,
        storeId,
        storeName,
        categoryId,
        categoryName,
        brandId,
        brandName,
        countryId,
        imageCover,
        status
      ];

  @override
  String toString() {
    return 'Product: (id=$id, productName=$productName)';
  }
}
