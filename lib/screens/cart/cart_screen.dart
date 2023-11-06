import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/logic/blocs/cart/cart_bloc.dart';
import 'package:my_app/model/customer.dart';
import 'package:my_app/model/jwt.dart';
import 'package:my_app/model/store.dart';
import 'package:my_app/model/store_extra.dart';
import 'package:my_app/screens/cart/components/button_pay.dart';
import 'package:my_app/screens/cart/components/button_reserve.dart';
import 'package:my_app/screens/cart/components/cart_product_card.dart';
import 'package:my_app/screens/cart/components/cost.dart';
import 'package:my_app/services/customer_service.dart';
import 'package:my_app/services/shared_pref%20_service.dart';
import 'package:my_app/services/store_service.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required this.onItemTapped, this.customerId});

  final ValueChanged<int> onItemTapped;
  final int? customerId;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Jwt jwt = Jwt();
  bool isStore = true;
  bool isLoading = true;
  SharedPref sharedPref = SharedPref();
  String? avatar = 'https://cdn-icons-png.flaticon.com/512/6386/6386976.png';
  int? id;

  @override
  void initState() {
    super.initState();
    loadUserInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primary,
                ),
              );
            }
            if (state is CartLoaded) {
              Map store = state.cart.productStore(state.cart.products);
              if (state.cart.products.isEmpty) {
                return const Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Icon(
                        Icons.signal_cellular_no_sim_outlined,
                        color: AppColor.primary,
                        size: 100,
                      ),
                      Text(
                        'Không có sản phẩm \ntrong giỏ hàng',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Solway',
                            fontSize: 20,
                            color: AppColor.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }
              return Column(
                children: [
                  Expanded(
                      child: Scrollbar(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: store.keys.length,
                      itemBuilder: (context, index) {
                        Map cart = state.cart
                            .productQuantity(store.values.elementAt(index));

                        return Column(
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
                                  '${cart.values.elementAt(0).storeName}',
                                  style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize: 20 * ffem),
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cart.keys.length,
                              itemBuilder: (context, index) {
                                // final item = cart.keys.elementAt(index);
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 10 * fem),
                                      child: CartProductCard(
                                        fem: fem,
                                        ffem: ffem,
                                        product: cart.values.elementAt(index),
                                      ),
                                    ),
                                    const Divider(
                                      color: Color.fromARGB(255, 218, 216, 216),
                                    )
                                  ],
                                );
                                // return Dismissible(
                                //     onDismissed: (direction) {
                                //       setState(() {
                                //         final itemToRemove = cart.key
                                //       });
                                //     },
                                //     key: Key(item.toString()),
                                //     child: CartProductCard(
                                //         fem: fem,
                                //         ffem: ffem,
                                //         product: cart.keys.elementAt(index),
                                //         quantity: cart.values.elementAt(index)));
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  )),

                  Cost(
                    fem: fem,
                    ffem: ffem,
                    subTotal: state.cart.subTotal,
                    deliveryFree: state.cart.deliveryFree,
                    tax: state.cart.tax,
                    total: state.cart.total(state.cart.subTotal,
                        state.cart.deliveryFree, state.cart.tax),
                    quantity: state.cart.products.length,
                  ),
                  // SizedBox(
                  //   height: 10 * fem,
                  // ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        4 * fem, 0 * fem, 8 * fem, 10 * fem),
                    width: double.infinity,
                    height: 49 * fem,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonReserve(fem: fem, ffem: ffem),
                          ButtonPay(fem: fem, ffem: ffem, id: id)
                        ]),
                  ),
                  SizedBox(
                    height: 5 * fem,
                  )
                ],
              );
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 100,
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      leadingWidth: 70.0,
      leading: Builder(builder: (BuildContext context) {
        return Container(
          height: 60,
          margin: const EdgeInsets.fromLTRB(20.0, 5.0, 5.0, 5.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(blurRadius: 5, color: Colors.black12, spreadRadius: 1)
            ],
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              color: Colors.greenAccent,
              icon: const Icon(
                Icons.home_filled,
                color: Colors.black,
                size: 20,
              ),
              onPressed: () {
                widget.onItemTapped(0);
              },
            ),
          ),
        );
      }),
      title: const Padding(
        padding: EdgeInsets.only(left: 65),
        child: Text(
          'Giỏ hàng',
          style: TextStyle(
            fontFamily: 'Solway',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void loadUserInfo() {
    sharedPref.read("jwt").then((value) => {
          jwt = Jwt.fromJsonString(value),
          if (jwt.role == "Customer")
            {
              isStore = false,
              CustomerService.getCustomerById(
                      jwt.token.toString(), (jwt.user as Customer).id!)
                  .then((value) => {
                        setState(() {
                          isLoading = false;
                          jwt.user = value as Customer;
                        })
                      }),
              avatar = (jwt.user as Customer).avatar,
              id = (jwt.user as Customer).id,
            }
          else if (jwt.role == "Store")
            {
              isStore = true,
              StoreService.getStoreById(
                      jwt.token.toString(), (jwt.user as Store).id!)
                  .then((value) => {
                        setState(() {
                          isLoading = false;
                          jwt.user = value as StoreExtra;
                        })
                      })
            }
        });
  }
}
