import 'package:my_app/model/category.dart';

class CategoryFilter {
  int id;
  Category category;
  bool value;

  CategoryFilter(
      {required this.id, required this.category, required this.value});

  CategoryFilter copyWith({
    int? id,
    Category? category,
    bool? value,
  }) {
    return CategoryFilter(
      id: id ?? this.id,
      category: category ?? this.category,
      value: value ?? this.value,
    );
  }

  static List<CategoryFilter> filters = Category.categories
      .map((category) =>
          CategoryFilter(id: category.id, category: category, value: false))
      .toList();
}
