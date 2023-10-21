// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_app/data/models/cart_model.dart';
// import 'package:my_app/logic/blocs/cart/cart_bloc.dart';
// import 'package:my_app/logic/cubits/counter/cubit/counter_cubit.dart';
// import 'package:my_app/screens/cart/components/button_pay.dart';
// import 'package:my_app/screens/cart/components/button_reserve.dart';
// import 'package:my_app/screens/cart/components/cart_product_card.dart';
// import 'package:my_app/screens/cart/components/cost.dart';
// import 'package:my_app/screens/cart/components/discount_code.dart';

// class Body extends StatelessWidget {
//   const Body({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double baseWidth = 375;
//     double fem = MediaQuery.of(context).size.width / baseWidth;
//     double ffem = fem * 0.97;
//     return Column(
//       children: [
//         Expanded(
//           child: ListView.builder(
//             itemCount: state.car,
//             itemBuilder: (context, index) {
//               return CartProductCard(
//                   fem: fem, ffem: ffem, product: Cart().products[index]);
//             },
//           ),
//         ),
//         DiscountCode(fem: fem, ffem: ffem),
//         Cost(fem: fem, ffem: ffem, subTotal: Cart().subTotal,),
//         Container(
//           margin: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 8 * fem, 10 * fem),
//           width: double.infinity,
//           height: 49 * fem,
//           child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ButtonReserve(fem: fem, ffem: ffem),
//                 ButtonPay(fem: fem, ffem: ffem)
//               ]),
//         )
//       ],
//     );
//   }
// }
