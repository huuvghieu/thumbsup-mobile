import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/category_model.dart';

class CategoryFilterModel extends Equatable {
  final int id;
  final CategoryModel categoryModel;
  final bool isSelected;

  const CategoryFilterModel({
    required this.id,
    required this.categoryModel,
    required this.isSelected,
  });

  CategoryFilterModel copyWith(
      {int? id, CategoryModel? categoryModel, bool? isSelected}) {
    return CategoryFilterModel(
        id: id ?? this.id,
        categoryModel: categoryModel ?? this.categoryModel,
        isSelected: isSelected ?? this.isSelected);
  }

  // static List<CategoryFilterModel> filters = CategoryModel.categories
  //     .map((category) => CategoryFilterModel(
  //         id: category.id,
  //         categoryModel: category,
  //         isSelected: false))
  //     .toList();

  static List<CategoryFilterModel> filters = [];

  @override
  List<Object?> get props => [id, categoryModel, isSelected];
}
