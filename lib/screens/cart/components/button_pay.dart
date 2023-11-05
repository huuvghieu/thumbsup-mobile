import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/repositories/geolocation_repository.dart';
import 'package:my_app/data/repositories/local_storage_repository.dart';
import 'package:my_app/data/repositories/order_repository.dart';
import 'package:my_app/data/repositories/place_repository.dart';
import 'package:my_app/data/repositories/review_repository.dart';
import 'package:my_app/logic/blocs/cart/cart_bloc.dart';
import 'package:my_app/logic/blocs/checkout/checkout_bloc.dart';
import 'package:my_app/screens/payment/screens/checkout_screen.dart';
import 'package:my_app/screens/payment/screens/completed_payment_screen.dart';
import 'package:my_app/screens/payment/screens/set_location_screen.dart';

class ButtonPay extends StatelessWidget {
  const ButtonPay({
    super.key,
    required this.fem,
    required this.ffem,
    required this.id,
  });

  final double fem;
  final double ffem;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primary,
            ),
          );
        }
        if (state is CartLoaded) {
          Map cart = state.cart.productQuantity(state.cart.products);
          return Container(
            margin: EdgeInsets.fromLTRB(33 * fem, 0 * fem, 0 * fem, 0 * fem),
            width: 130 * fem,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(23.5 * fem),
            ),
            child: TextButton(
              onPressed: () => {
                if (cart.isEmpty)
                  {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(
                        elevation: 0,
                        duration: const Duration(milliseconds: 2000),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Không có sản phẩm!',
                          message: 'Giỏ hàng không có sản phẩm để thanh toán!',
                          contentType: ContentType.failure,
                        ),
                      ))
                  }
                else
                  {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => BlocProvider(
                    //               create: (context) => CheckoutBloc(
                    //                   cartBloc: context.read<CartBloc>(),
                    //                   orderRepository:
                    //                       context.read<OrderRepository>()),
                    //               child: CheckoutScreen(
                    //                 id: id,
                    //               ),
                    //             )))

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => RepositoryProvider(
                    //             create: (context) => ReviewRepository(),
                    //             child: CompletedPaymentScreen(),
                    //           ),

                    // ))

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MultiRepositoryProvider(
                            providers: [
                              RepositoryProvider(
                                create: (context) => GeolocationRepository(),
                              ),
                              RepositoryProvider(
                                create: (context) => PlacesRepository(),
                              ),
                            ],
                            child: SetLocationScreem(),
                          ),
                        ))
                  }
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.resolveWith<
                      RoundedRectangleBorder?>((Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused)) {
                      return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.3 * fem),
                          side: const BorderSide(
                            color: AppColor.primary,
                          ));
                    }
                    return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.3 * fem),
                        side: const BorderSide(
                          color: Colors.white,
                        ));
                  }),
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(AppColor.primary)),
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
          );
        } else {
          return Text('Something went wrong');
        }
      },
    );
  }
}
