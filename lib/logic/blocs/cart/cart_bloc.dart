import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/cart_model.dart';
import 'package:my_app/data/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<LoadCartEvent>(_onCartStarted);
    on<AddProductEvent>(_onCartProductAdded);
    on<RemoveProductEvent>(_onCartProductRemoved);
  }

  Future<void> _onCartStarted(
      LoadCartEvent event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(CartLoaded(cart: Cart(products: [])));
    } catch (_) {
      emit(CartError());
    }
  }

  Future<void> _onCartProductAdded(
      AddProductEvent event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        emit(
          CartLoaded(
            cart: Cart(
              products: (state as CartLoaded).cart.products..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }

  Future<void> _onCartProductRemoved(
      RemoveProductEvent event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        final products = (state as CartLoaded).cart.products;
        emit(
          CartLoaded(
            cart: Cart(
              products: products..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(CartError());
      }
    }
  }
}
