import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/cart_model.dart';
import 'package:my_app/model/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onCartStarted);
    on<CartProductAdded>(_onCartProductAdded);
    on<CartProductRemoved>(_onCartProductRemoved);
  }

  Future<void> _onCartStarted(
      CartStarted event, Emitter<CartState> emit) async {
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      emit(CartLoaded());
    } catch (_) {}
  }

  Future<void> _onCartProductAdded(
      CartProductAdded event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final state = this.state as CartLoaded;
      emit(CartLoaded(
          cart: Cart(
              products: List.from(state.cart.products)..add(event.product))));
    }
  }

  Future<void> _onCartProductRemoved(
      CartProductRemoved event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      final state = this.state as CartLoaded;
      emit(CartLoaded(
          cart: Cart(
              products: List.from(state.cart.products)
                ..remove(event.product))));
    }
  }
}
