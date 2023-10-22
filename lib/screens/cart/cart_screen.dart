import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/cart_model.dart';
import 'package:my_app/logic/blocs/cart/cart_bloc.dart';
import 'package:my_app/logic/cubits/counter/cubit/counter_cubit.dart';
import 'package:my_app/screens/cart/components/button_pay.dart';
import 'package:my_app/screens/cart/components/button_reserve.dart';
import 'package:my_app/screens/cart/components/cart_product_card.dart';
import 'package:my_app/screens/cart/components/cost.dart';
import 'package:my_app/screens/cart/components/discount_code.dart';

class CartScreen extends StatefulWidget {
   const CartScreen({super.key, required this.onItemTapped});

  final ValueChanged<int> onItemTapped;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (_) => CartBloc()..add(CartStarted()),
        )
      ],
      child: GestureDetector(
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
                return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: state.cart.products.length,
            itemBuilder: (context, index) {
              return CartProductCard(
                  fem: fem, ffem: ffem, product: state.cart.products[index]);
            },
          ),
        ),
        DiscountCode(fem: fem, ffem: ffem),
        Cost(fem: fem, ffem: ffem, subTotal: Cart().subTotal,),
        Container(
          margin: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 8 * fem, 10 * fem),
          width: double.infinity,
          height: 49 * fem,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtonReserve(fem: fem, ffem: ffem),
                ButtonPay(fem: fem, ffem: ffem)
              ]),
        )
      ],
    );
              } else {
                return Text('Something went wrong');
              }
            },
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 90.0,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.white,
      leadingWidth: 70.0,
      title: const Center(
        child: Text(
          'Giỏ hàng',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Solway',
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
