import 'package:my_app/filter/brand_filter_model.dart';
import 'package:my_app/filter/category_filter_model.dart';
import 'package:my_app/filter/price_filter_model.dart';

class Filter {
  final PriceFilter priceFilter;
  final List<CategoryFilter> categoryFilters;
  final List<BrandFilter> brandFilters;

  Filter({
    required this.priceFilter,
    this.categoryFilters = const <CategoryFilter>[],
    this.brandFilters = const <BrandFilter>[]
  });
}