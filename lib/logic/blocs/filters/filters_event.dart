part of 'filters_bloc.dart';

@immutable
abstract class FiltersEvent extends Equatable {}

class FilterLoad extends FiltersEvent {
  @override
  List<Object?> get props => [];
}

// class PriceFilterUpdated extends FiltersEvent {
//   final PriceFilter priceFilter;

//   PriceFilterUpdated({required this.priceFilter});
// }

class CategoryFilterUpdated extends FiltersEvent {
  final CategoryFilterModel categoryFilter;

  CategoryFilterUpdated({required this.categoryFilter});

  @override
  List<Object?> get props => [categoryFilter];
}

class BrandFilterUpdated extends FiltersEvent {
  final BrandFilterModel brandFilter;

  BrandFilterUpdated({required this.brandFilter});

  @override
  List<Object?> get props => [brandFilter];
}

class PriceFilterUpdated extends FiltersEvent {
  final PriceFilterModel priceFilter;

  PriceFilterUpdated({required this.priceFilter});

  @override
  List<Object?> get props => [priceFilter];
}
