import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CategoryModel extends Equatable{
  final int id;
  final String category;
  String? description;
  bool? status;

  CategoryModel({
    required this.id,
    required this.category,
    this.description,
    this.status,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      category: json['category'],
      description: json['description'],
      status: json['status'],
    );
  }
  
  @override
  List<Object?> get props => [id, category, description, status];
}
  
