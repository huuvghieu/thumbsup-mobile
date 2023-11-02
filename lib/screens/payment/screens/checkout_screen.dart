import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/checkout_model.dart';
import 'package:my_app/data/models/create_model/create_order_detail_model.dart';
import 'package:my_app/data/models/create_model/create_order_model.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/data/repositories/review_repository.dart';
import 'package:my_app/logic/blocs/cart/cart_bloc.dart';
import 'package:my_app/logic/blocs/checkout/checkout_bloc.dart';
import 'package:my_app/screens/cart/components/cost.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:my_app/screens/payment/screens/completed_payment_screen.dart';

import '../components/item_card.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key, required this.id});
  int? id;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: buildAppBar(context),
          backgroundColor: Colors.white,
          body: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ),
                );
              }

              if (state is CheckoutLoadedState) {
                Map store = state.cart!.productStore(state.cart!.products);
                //sent event with customerId
                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckoutEvent(customerId: (id as num).toInt()));
                List<CreateOrderModel> orderList = [];

                return Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: store.keys.length,
                      itemBuilder: (context, index) {
                        //map List<ProductModel> to List<CreateOrderDetailModel>
                        List<CreateOrderDetailModel> detailList = (store.values
                                .elementAt(index) as List<ProductModel>)
                            .map((product) => CreateOrderDetailModel(
                                  originalPrice: product.originalPrice,
                                  discount: product.discount,
                                  salePrice: product.salePrice,
                                  quantity: product.quantity,
                                  amount:
                                      (product.quantity! * product.salePrice),
                                  productId: product.id,
                                  state: product.state,
                                ))
                            .toList();

                        //get total for each orderDetail
                        double amount = 0;
                        detailList.forEach((detail) {
                          amount += detail.amount!;
                        });

                        Map cart = state.cart!
                            .productQuantity(store.values.elementAt(index));

                        //create order
                        CreateOrderModel order = CreateOrderModel(
                            amount: amount,
                            customerId: id,
                            state: true,
                            orderDetailList: detailList);

                        orderList.add(order);

                        return Container(
                          height: 250 * fem,
                          width: double.infinity,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 250, 237, 223))),
                                child: Padding(
                                  padding: EdgeInsets.all(10 * fem),
                                  child: Text(
                                    '${cart.keys.elementAt(0).storeName}',
                                    style: TextStyle(
                                        color: AppColor.primary,
                                        fontSize: 20 * ffem),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: cart.keys.length,
                                  itemBuilder: (context, index) {
                                    // final item = cart.keys.elementAt(index);
                                    return Column(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(left: 10 * fem),
                                          child: ItemCard(
                                            fem: fem,
                                            ffem: ffem,
                                            productModel:
                                                cart.keys.elementAt(index),
                                            quanity:
                                                cart.values.elementAt(index),
                                          ),
                                        ),
                                        const Divider(
                                          color: Color.fromARGB(
                                              255, 218, 216, 216),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )),

                    Cost(
                      fem: fem,
                      ffem: ffem,
                      subTotal: state.cart!.subTotal,
                      deliveryFree: state.cart!.deliveryFree,
                      tax: state.cart!.tax,
                      total: state.cart!.total(state.cart!.subTotal,
                          state.cart!.deliveryFree, state.cart!.tax),
                      quantity: state.cart!.products.length,
                    ),
                    // SizedBox(
                    //   height: 10 * fem,
                    // ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 0 * fem),
                      width: 130 * fem,
                      height: 40 * fem,
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(23.5 * fem),
                      ),
                      child: TextButton(
                        onPressed: () => {
                          context.read<CheckoutBloc>().add(ConfirmCheckoutEvent(
                              checkoutModel:
                                  CheckoutModel(orderList: orderList))),
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith<
                                    RoundedRectangleBorder?>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused)) {
                                return RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(25.3 * fem),
                                    side: const BorderSide(
                                      color: AppColor.primary,
                                    ));
                              }
                              return RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(25.3 * fem),
                                  side: const BorderSide(
                                    color: Colors.white,
                                  ));
                            }),
                            backgroundColor: MaterialStateProperty.all<Color?>(
                                AppColor.primary)),
                        child: Center(
                          child: Text(
                            'THANH TOÁN',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12 * ffem,
                                fontFamily: 'Solway'),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5 * fem,
                    )
                  ],
                );
              }

              if (state is CheckoutSuccessState) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RepositoryProvider(
                                create: (context) => ReviewRepository(),
                                child: const CompletedPaymentScreen(),
                              )));
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      elevation: 0,
                      duration: const Duration(milliseconds: 2000),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Đặt hàng thành công!',
                        message: 'Đơn hàng của bạn đã đặt thành công!',
                        contentType: ContentType.success,
                      ),
                    ));
                });
                context.read<CartBloc>().add(LoadCartEvent());
              } else if (state is CheckoutFailedState) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Home(index: 0)));
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      elevation: 0,
                      duration: const Duration(milliseconds: 2000),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Đặt hàng thất bại!',
                        message: 'Đơn hàng của bạn đặt thất bại!',
                        contentType: ContentType.failure,
                      ),
                    ));
                });
              }

              return const Text('Something went wrong');
            },
          )),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return AppBar(
      toolbarHeight: 100 * fem,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leadingWidth: 70.0,
      leading: Builder(builder: (BuildContext context) {
        return Container(
          height: 60 * fem,
          margin: EdgeInsets.fromLTRB(20 * fem, 5 * fem, 0 * fem, 5 * fem),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5 * fem,
                  color: Colors.black12,
                  spreadRadius: 1 * fem)
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              color: Colors.greenAccent,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.black,
                size: 20 * fem,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        );
      }),
      title: const Center(
        child: Text(
          'Xác nhận thông tin',
          style: TextStyle(
            fontFamily: 'Solway',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
