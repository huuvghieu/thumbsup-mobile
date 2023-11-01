part of 'filters_bloc.dart';

@immutable
abstract class FiltersState extends Equatable {}

class FiltersLoading extends FiltersState {
  @override
  List<Object?> get props => [];
}

class FiltersLoaded extends FiltersState {
  final FilterModel filter;
  //  List<ProductModel>? filterdProductModels;
  List<CategoryModel>? categories;
  List<BrandModel>? brands;

  FiltersLoaded({required this.filter, this.categories, this.brands});

  @override
  List<Object?> get props => [filter, categories, brands];
}
