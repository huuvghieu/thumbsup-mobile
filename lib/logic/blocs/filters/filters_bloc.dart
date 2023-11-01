import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:my_app/data/models/brand_filter_model.dart';
import 'package:my_app/data/models/brand_model.dart';
import 'package:my_app/data/models/category_filter_model.dart';
import 'package:my_app/data/models/category_model.dart';
import 'package:my_app/data/models/filter_model.dart';
import 'package:my_app/data/models/price_filter_model.dart';
import 'package:my_app/data/repositories/brand_repository.dart';
import 'package:my_app/data/repositories/category_repository.dart';
import 'package:my_app/data/repositories/product_repository.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  final CategoryRepository categoryRepository;
  final BrandRepository brandRepository;
  final ProductRepository productRepository;
  FiltersBloc(
      {required this.categoryRepository,
      required this.brandRepository,
      required this.productRepository})
      : super(FiltersLoading()) {
    on<FilterLoad>(_onLoadFilter);
    on<PriceFilterUpdated>(_onUpdatePriceFilter);
    on<CategoryFilterUpdated>(_onUpdateCategoryFilter);
    on<BrandFilterUpdated>(_onUpdateBrandFilter);
  }

  void _onLoadFilter(
    FilterLoad event,
    Emitter<FiltersState> emit,
  ) async {
    final categories = await categoryRepository.getCategories();
    CategoryFilterModel.filters = categories!
        .map((e) =>
            CategoryFilterModel(id: e.id, categoryModel: e, isSelected: false))
        .toList();
    //brands
    final brands = await brandRepository.getBrands();
    BrandFilterModel.filters = brands!
        .map(
            (e) => BrandFilterModel(id: e.id, brandModel: e, isSelected: false))
        .toList();
    emit(
      FiltersLoaded(
        filter: FilterModel(
            priceFilter: PriceFilterModel.filter,
            categoryFilters: CategoryFilterModel.filters,
            brandFilters: BrandFilterModel.filters),
      ),
    );
  }

  void _onUpdateCategoryFilter(
    CategoryFilterUpdated event,
    Emitter<FiltersState> emit,
  ) async {
    final state = this.state;

    if (state is FiltersLoaded) {
      final List<CategoryFilterModel> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();

      var categories = updatedCategoryFilters
          .where((filter) => filter.isSelected)
          .map((filter) => filter.categoryModel)
          .toList();

      var brands = state.filter.brandFilters
          .where((filter) => filter.isSelected)
          .map((filter) => filter.brandModel)
          .toList();

      emit(
        FiltersLoaded(
          filter: FilterModel(
            priceFilter: state.filter.priceFilter,
            categoryFilters: updatedCategoryFilters,
            brandFilters: state.filter.brandFilters,
          ),
          categories: categories,
          brands: brands
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
      final List<BrandFilterModel> updatedBrandFilters =
          state.filter.brandFilters.map((brandFilter) {
        return brandFilter.id == event.brandFilter.id
            ? event.brandFilter
            : brandFilter;
      }).toList();

      var categories = state.filter.categoryFilters
          .where((filter) => filter.isSelected)
          .map((filter) => filter.categoryModel)
          .toList();

      var brands = updatedBrandFilters
          .where((filter) => filter.isSelected)
          .map((filter) => filter.brandModel)
          .toList();
          
      emit(
        FiltersLoaded(
          filter: FilterModel(
            priceFilter: state.filter.priceFilter,
            categoryFilters: state.filter.categoryFilters,
            brandFilters: updatedBrandFilters,
          ),
          categories: categories,
          brands: brands
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
      final PriceFilterModel updatedPriceFilters = event.priceFilter;

      var categories = state.filter.categoryFilters
          .where((filter) => filter.isSelected)
          .map((filter) => filter.categoryModel)
          .toList();

      var brands = state.filter.brandFilters
          .where((filter) => filter.isSelected)
          .map((filter) => filter.brandModel)
          .toList();

      emit(
        FiltersLoaded(
          filter: FilterModel(
            priceFilter: updatedPriceFilters,
            categoryFilters: state.filter.categoryFilters,
            brandFilters: state.filter.brandFilters,
          ),
          brands: brands,
          categories: categories
        ),
      );
    }
  }

  // Future<List<ProductModel>> _getFilteredProducts(
  //     List<CategoryModel> categories) async {
  //   return productRepository.filteredProducts(categories);
  // }
}
