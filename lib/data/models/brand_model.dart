import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BrandModel extends Equatable {
  final int id;
  final String brand;
  String? description;
  bool? status;

  BrandModel({
    required this.id,
    required this.brand,
    this.description,
    this.status,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      brand: json['brand'],
      description: json['description'],
      status: json['status'],
    );
  }

  static List<BrandModel> brands = [];

  @override
  List<Object?> get props => [id, brand, description, status];
}
