import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/brand_filter_model.dart';
import 'package:my_app/data/models/category_filter_model.dart';
import 'package:my_app/data/models/price_filter_model.dart';

class FilterModel extends Equatable {
  final List<CategoryFilterModel> categoryFilters;
  final List<BrandFilterModel> brandFilters;
  final PriceFilterModel priceFilter;

  const FilterModel(
      {this.categoryFilters = const <CategoryFilterModel>[],
      this.brandFilters = const <BrandFilterModel>[],
      required this.priceFilter
      });

  FilterModel copyWith(
      {List<CategoryFilterModel>? categoryFilters,
      PriceFilterModel? priceFilter,
      List<BrandFilterModel>? brandFilters}) {
    return FilterModel(
      categoryFilters: categoryFilters ?? this.categoryFilters,
      brandFilters: brandFilters ?? this.brandFilters,
      priceFilter: priceFilter ?? this.priceFilter
    );
  }
  
  @override
  List<Object?> get props => [categoryFilters, brandFilters, priceFilter];
}
