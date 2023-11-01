import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/data/models/cart_model.dart';
import 'package:my_app/data/models/checkout_model.dart';
import 'package:my_app/data/models/create_model/create_order_detail_model.dart';
import 'package:my_app/data/models/create_model/create_order_model.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/data/repositories/order_repository.dart';
import 'package:my_app/logic/blocs/cart/cart_bloc.dart';
import 'package:my_app/services/network_handler.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CartBloc cartBloc;
  final OrderRepository orderRepository;
  String? id;
  CheckoutBloc({required this.cartBloc, required this.orderRepository})
      : super(cartBloc.state is CartLoaded
            ? CheckoutLoadedState(cart: (cartBloc.state as CartLoaded).cart)
            : CheckoutLoadingState()) {
    on<UpdateCheckoutEvent>(_onUpdateCheckout);
    on<ConfirmCheckoutEvent>(_onConfirmCheckout);
  }

  void _onUpdateCheckout(
      UpdateCheckoutEvent event, Emitter<CheckoutState> emit) {
    if (this.state is CheckoutLoadedState) {
      final state = this.state as CheckoutLoadedState;
      emit(CheckoutLoadedState(cart: (cartBloc.state as CartLoaded).cart));
    }
  }

  void _onConfirmCheckout(
      ConfirmCheckoutEvent event, Emitter<CheckoutState> emit) async {
    if (this.state is CheckoutLoadedState) {
      try {
        List<CreateOrderModel> orderList = event.checkoutModel.orderList;
        orderList.forEach((order) async {
          bool rs = await orderRepository.createOrder(true, order);
          if (!rs) {
            emit(CheckoutFailedState());
          }
        });
        (cartBloc.state as CartLoaded).cart.products = <ProductModel>[];
        emit(CheckoutSuccessState());
      } catch (_) {
        emit(CheckoutFailedState());
      }
    }
  }

  void getUserId() async {
    id = await NetWorkHandler.storage.read(key: 'customerId');
  }
}





// detailList: (cartBloc.state as CartLoaded)
                //     .cart
                //     .products
                //     .map((product) => CreateOrderDetailModel(
                //           originalPrice: product.originalPrice,
                //           discount: product.discount,
                //           salePrice: product.salePrice,
                //           quantity: product.quantity,
                //           amount: (product.quantity! * product.salePrice),
                //           productId: product.id,
                //           state: product.state,
                //         ))
                //     .toList(),
                // //
                // orderModel: CreateOrderModel(
                //   amount: (cartBloc.state as CartLoaded).cart.total(
                //       (cartBloc.state as CartLoaded).cart.subTotal,
                //       (cartBloc.state as CartLoaded).cart.deliveryFree,
                //       (cartBloc.state as CartLoaded).cart.tax),
                //   state: true,
                //   orderDetailList: (cartBloc.state as CartLoaded)
                //       .cart
                //       .products
                //       .map((product) => CreateOrderDetailModel(
                //             originalPrice: product.originalPrice,
                //             discount: product.discount,
                //             salePrice: product.salePrice,
                //             quantity: product.quantity,
                //             amount: (product.quantity! * product.salePrice),
                //             productId: product.id,
                //           ))
                //       .toList(),
                // ),