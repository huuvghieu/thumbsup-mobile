import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/filter/brand_filter_model.dart';
import 'package:my_app/filter/category_filter_model.dart';
import 'package:my_app/filter/price_filter_model.dart';

import '../../model/filter.dart';

part 'filters_event.dart';

part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersLoading()) {
    on<FilterLoad>(_onLoadFilter);
    on<PriceFilterUpdated>(_onUpdatePriceFilter);
    on<CategoryFilterUpdated>(_onUpdateCategoryFilter);
    on<BrandFilterUpdated>(_onUpdateBrandFilter);
  }

  void _onLoadFilter(
    FilterLoad event,
    Emitter<FiltersState> emit,
  ) async {
    emit(
      FiltersLoaded(
        filter: Filter(
            priceFilter: PriceFilter.filter,
            categoryFilters: CategoryFilter.filters,
            brandFilters: BrandFilter.filters),
      ),
    );
  }

  void _onUpdateCategoryFilter(
    CategoryFilterUpdated event,
    Emitter<FiltersState> emit,
  ) async {
    final state = this.state;

    if (state is FiltersLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();

      emit(
        FiltersLoaded(
          filter: Filter(
            priceFilter: state.filter.priceFilter,
            categoryFilters: updatedCategoryFilters,
            brandFilters: state.filter.brandFilters,
          ),
        ),
      );
    }
  }

  void _onUpdateBrandFilter(
    BrandFilterUpdated event,
    Emitter<FiltersState> emit,
  ) async {
    final state = this.state;

    if (state is FiltersLoaded) {
      final List<BrandFilter> updatedBrandFilters =
          state.filter.brandFilters.map((brandFilter) {
        return brandFilter.id == event.brandFilter.id
            ? event.brandFilter
            : brandFilter;
      }).toList();

      emit(
        FiltersLoaded(
          filter: Filter(
            priceFilter: state.filter.priceFilter,
            categoryFilters: state.filter.categoryFilters,
            brandFilters: updatedBrandFilters,
          ),
        ),
      );
    }
  }

  void _onUpdatePriceFilter(
    PriceFilterUpdated event,
    Emitter<FiltersState> emit,
  ) async {
    final state = this.state;

    if (state is FiltersLoaded) {
      final PriceFilter updatedPriceFilters = event.priceFilter;

      emit(
        FiltersLoaded(
          filter: Filter(
            priceFilter: updatedPriceFilters,
            categoryFilters: state.filter.categoryFilters,
            brandFilters: state.filter.brandFilters,
          ),
        ),
      );
    }
  }
}
