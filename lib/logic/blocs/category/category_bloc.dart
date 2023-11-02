import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/data/models/category_model.dart';
import 'package:my_app/data/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  CategoryBloc(this._categoryRepository) : super(CategoryLoadingState()) {
    on<LoadCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());

      try {
        final categories = await _categoryRepository.getCategories();
        emit(CategoryLoadedState(categories!));
      } catch (e) {
        emit(CategoryErrorState(e.toString()));
      }
    });
  }
}
