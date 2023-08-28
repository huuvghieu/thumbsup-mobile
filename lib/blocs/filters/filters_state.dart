part of 'filters_bloc.dart';

@immutable
abstract class FiltersState {}

class FiltersLoading extends FiltersState {}

class FiltersLoaded extends FiltersState {
  final Filter filter;

  FiltersLoaded({Filter? filter})
      : filter = filter ?? Filter(priceFilter: PriceFilter.filter);
}
