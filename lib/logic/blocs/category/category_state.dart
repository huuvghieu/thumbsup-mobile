part of 'category_bloc.dart';
@immutable
abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryLoadingState extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoadedState extends CategoryState {
  const CategoryLoadedState(this.categoryModels);
  final List<CategoryModel> categoryModels;

  @override
  List<Object> get props => [categoryModels];
}

class CategoryErrorState extends CategoryState {
  const CategoryErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}