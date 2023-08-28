part of 'filters_bloc.dart';

@immutable
abstract class FiltersEvent {}

class FilterLoad extends FiltersEvent {}

class PriceFilterUpdated extends FiltersEvent {
  final PriceFilter priceFilter;

  PriceFilterUpdated({required this.priceFilter});
}

class CategoryFilterUpdated extends FiltersEvent {
  final CategoryFilter categoryFilter;

  CategoryFilterUpdated({required this.categoryFilter});
}

class BrandFilterUpdated extends FiltersEvent {
  final BrandFilter brandFilter;

  BrandFilterUpdated({required this.brandFilter});
}