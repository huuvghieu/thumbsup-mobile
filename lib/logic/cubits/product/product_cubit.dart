import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/data/models/brand_model.dart';
import 'package:my_app/data/models/category_model.dart';
import 'package:my_app/data/models/price_model.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/data/repositories/product_repository.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  List<CategoryModel>? categories;
  List<BrandModel>? brands;
  PriceModel? priceStart;
  PriceModel? priceEnd;

  ProductCubit(this.productRepository, this.categories, this.brands,
      this.priceStart, this.priceEnd)
      : super(ProductInitial());

  int page = 0;
  final ProductRepository productRepository;

  void loadProducts() {
    if (state is ProductLoadingState) return;

    final currentState = state;

    var oldProducts = <ProductModel>[];
    if (currentState is ProductLoadedState) {
      oldProducts = currentState.products;
    }

    emit(
        ProductLoadingState(oldProducts: oldProducts, isFirstFetch: page == 0));

    productRepository
        .filteredProducts(page, categories!, brands!, priceStart!, priceEnd!)
        .then((newProducts) {
      page++;
      final products = (state as ProductLoadingState).oldProducts;
      products.addAll(newProducts);

      emit(ProductLoadedState(products: products));
    });

    // var newProducts = productRepository.filteredProducts(
    //     page, categories!, brands!, priceStart!, priceEnd!);
    // if ((newProducts as List<ProductModel>).isEmpty) {
    //   emit(constProductErrorState(error: 'Không tìm thấy sản phẩm'));
    // }
    // newProducts.then((value) {
    //   page++;
    //   final products = (state as ProductLoadingState).oldProducts;
    //   products.addAll(value);

    //   emit(ProductLoadedState(products: products));
    // });
  }
}
