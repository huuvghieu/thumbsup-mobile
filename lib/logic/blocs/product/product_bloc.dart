import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/data/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({ required this.productRepository}) : super(ProductLoadingState()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoadingState());

      try {
        // final products = await _productRepository.getProducts();
        // emit(ProductLoadedState(products));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
    });
    on<LoadProductByIdEvent>(_onLoadProductId);
  }

  Future<void> _onLoadProductId(LoadProductByIdEvent event, Emitter<ProductState> emit) async{
      emit(ProductLoadingState());
      try {
        final product = await productRepository.getProductById(event.id!);
        emit(ProductByIdLoadedState(product));
      } catch (e) {
        emit(ProductErrorState(e.toString()));
      }
  }
}
