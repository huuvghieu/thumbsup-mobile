import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/logic/cubits/counter/cubit/counter_cubit.dart';
import 'package:my_app/model/product.dart';

class CartProductCard extends StatelessWidget {
   CartProductCard({
    super.key,
    required this.fem,
    required this.ffem,
    required this.product,
  });

  final double fem;
  final double ffem;
  Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10 * fem),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.image.toString(),
            height: 80,
            width: 90,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 5 * fem,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 180 * fem,
                child: Text(
                  product.name.toString(),
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'Solway',
                    fontSize: 17 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2 * ffem / fem,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                'Đồ điện tử',
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2 * ffem / fem,
                  color: AppColor.kTextColor,
                ),
              ),
              Text(
                changeCurrency(product.unitPrice!.toDouble() ?? 0),
                style: TextStyle(
                  fontFamily: 'Solway',
                  fontSize: 16 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2 * ffem / fem,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
          BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(children: [
                IconButton(
                  onPressed: () {},
                  icon: Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.delete_outline_outlined,
                      color: AppColor.primary,
                      size: 20 * fem,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      icon: const Icon(
                        Icons.remove_circle_outline,
                        color: AppColor.primary,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15 * fem),
                      child: Text(
                        state.counterValue.toString(),
                        style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 13 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2 * ffem / fem,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      icon: const Icon(
                        Icons.add_circle,
                        color: AppColor.primary,
                      ),
                    ),
                  ],
                ),
              ]);
            },
          )
        ],
      ),
    );
  }

String changeCurrency(double price) {
    return price.isNaN
        ? "0"
        : NumberFormat.currency(locale: 'vi').format(price);
  }
}
