import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String productName;
  final double originalPrice;
  final double salePrice;
  final int discount;
  int? shelfLife;
  double? weight;
  int? rating;
  int? quantity;
  int? numOfRating;
  String? description;
  bool? favor;
  bool? state;
  final int storeId;
  String? storeName;
  final int categoryId;
  String? categoryName;
  final int brandId;
  String? brandName;
  final int countryId;
  String? countryName;
  String? imageCover;
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
      this.quantity,
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
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['originalPrice'] = this.originalPrice;
    data['salePrice'] = this.salePrice;
    data['discount'] = this.discount;
    data['shelfLife'] = this.shelfLife;
    data['weight'] = this.weight;
    data['rating'] = this.rating;
    data['quantity'] = this.quantity;
    data['numOfRating'] = this.numOfRating;
    data['description'] = this.description;
    data['favor'] = this.favor;
    data['state'] = this.state;
    data['storeId'] = this.storeId;
    data['storeName'] = this.storeName;
    data['categoryId'] = this.categoryId;
    data['categoryName'] = this.categoryName;
    data['brandId'] = this.brandId;
    data['brandName'] = this.brandName;
    data['countryId'] = this.countryId;
    data['countryName'] = this.countryName;
    data['imageCover'] = this.imageCover;
    data['status'] = this.status;
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
}
