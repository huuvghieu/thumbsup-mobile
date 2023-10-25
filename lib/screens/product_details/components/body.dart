import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/common/image.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/data/repositories/store_repository.dart';
import 'package:my_app/logic/blocs/store/store_bloc.dart';
import 'package:my_app/logic/cubits/counter/cubit/counter_cubit.dart';
import 'package:my_app/screens/product_details/components/button_add_to_cart.dart';

class Body extends StatelessWidget {
  Body({super.key, required this.product});

  ProductModel product;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => StoreBloc(
              RepositoryProvider.of<StoreRepository>(context), product.storeId)
            ..add(const LoadStoreByIdEvent()),
        ),
      ],
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(22 * fem, 27 * fem, 5 * fem, 32 * fem),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                // color: Colors.blue,
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                width: double.infinity,
                height: 400 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Container(
                        width: 330.6 * fem,
                        height: 400 * fem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 0 * fem, 14 * fem),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        3 * fem, 0 * fem, 3 * fem, 22 * fem),
                                    padding: EdgeInsets.fromLTRB(
                                        0 * fem, 11 * fem, 0 * fem, 0 * fem),
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 26 * fem, 0 * fem),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 243, 241, 241)),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x3fd3d1d8),
                                                  offset: Offset(
                                                      15 * fem, 15 * fem),
                                                  blurRadius: 15 * fem,
                                                ),
                                              ],
                                            ),
                                            child: IconButton(
                                              color: Colors.greenAccent,
                                              icon: const Icon(
                                                Icons.arrow_back_ios_rounded,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                24 * fem, 0 * fem, 0 * fem),
                                            width: 170 * fem,
                                            height: 168 * fem,
                                            child: Image.network(
                                                product.imageCover.toString(),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.fromLTRB(
                                                25 * fem,
                                                0 * fem,
                                                0 * fem,
                                                0 * fem),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.place,
                                                color: Colors.purple,
                                                size: 40,
                                              ),
                                              onPressed: () {},
                                            ))
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 11 * fem),
                                    child: Text(
                                      product.productName.toString(),
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                          fontFamily: 'Solway',
                                          fontSize: 22 * ffem,
                                          height: 1.15 * ffem / fem,
                                          letterSpacing: -0.56 * fem,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 100 * fem, 0 * fem),
                                    width: double.infinity,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 8.53 * fem, 0 * fem),
                                          width: 17.78 * fem,
                                          height: 17 * fem,
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.yellow,
                                            size: 20 * fem,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              1 * fem, 0 * fem, 0 * fem),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    7 * fem,
                                                    0 * fem),
                                                child: Text(
                                                  '4.5',
                                                  style: TextStyle(
                                                      fontFamily: 'Solway',
                                                      fontSize: 14 * ffem,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      height: 1.25 * ffem / fem,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    13 * fem,
                                                    0 * fem),
                                                child: Text(
                                                  '(30+)',
                                                  style: TextStyle(
                                                    fontFamily: 'Solway',
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.25 * ffem / fem,
                                                    color: AppColor.kTextColor,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Xem đánh giá',
                                                style: TextStyle(
                                                  fontFamily: 'Solway',
                                                  fontSize: 13 * ffem,
                                                  height: 1.2 * ffem / fem,
                                                  fontWeight: FontWeight.w400,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: AppColor.primary,
                                                  decorationColor:
                                                      Colors.yellow,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 30 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17 * fem),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 30 * fem, 0 * fem),
                                    child: Text(
                                      changeCurrency(
                                          product.salePrice!.toDouble() ?? 0),
                                      style: TextStyle(
                                        fontFamily: 'Solway',
                                        fontSize: 20 * ffem,
                                        fontWeight: FontWeight.bold,
                                        height: 1.2 * ffem / fem,
                                        color: AppColor.primary,
                                      ),
                                    ),
                                  ),
                                  BlocConsumer<CounterCubit, CounterState>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      return Container(
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 10 * fem, 0.4 * fem),
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(17 * fem),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            FloatingActionButton(
                                              onPressed: () {
                                                BlocProvider.of<CounterCubit>(
                                                        context)
                                                    .decrement();
                                              },
                                              backgroundColor: Colors.white,
                                              shape: const CircleBorder(
                                                  side: BorderSide(
                                                      color: AppColor.primary)),
                                              child: const Icon(
                                                Icons.remove,
                                                color: AppColor.primary,
                                              ),
                                            ),
                                            Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0 * fem,
                                                    0 * fem,
                                                    0 * fem,
                                                    3 * fem),
                                                child: Text(
                                                  state.counterValue.toString(),
                                                  style: TextStyle(
                                                    fontFamily: 'Solway',
                                                    fontSize: 18 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2 * ffem / fem,
                                                    color: Colors.black,
                                                  ),
                                                )),
                                            FloatingActionButton(
                                              onPressed: () {
                                                BlocProvider.of<CounterCubit>(
                                                        context)
                                                    .increment();
                                              },
                                              backgroundColor: AppColor.primary,
                                              shape: const CircleBorder(
                                                  side: BorderSide(
                                                      color: Colors.white)),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 15 * fem, 0 * fem, 0 * fem),
                              width: double.infinity,
                              child: Text(
                                changeCurrency(
                                    (product.originalPrice!.toDouble()) ?? 0),
                                style: TextStyle(
                                  fontFamily: 'Solway',
                                  fontSize: 19 * ffem,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.lineThrough,
                                  color:
                                      const Color.fromARGB(255, 192, 191, 191),
                                  decorationColor:
                                      const Color.fromARGB(255, 192, 191, 191),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 238 * fem,
                      top: 180 * fem,
                      child: const Align(
                        child: Padding(
                          padding: EdgeInsets.all(7.0),
                          child: SizedBox(
                            child: Stack(children: [
                              Image(
                                image: AssetImage(saleTag),
                                height: 30.0,
                              ),
                              Positioned(
                                right: 23,
                                child: Text(
                                  "20",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 1 * fem),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  title: Text(
                    'Mô tả sản phẩm',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 18 * fem,
                      height: 1.56 * ffem / fem,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        product.description.toString(),
                        style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 13 * fem,
                          height: 1.56 * ffem / fem,
                          fontWeight: FontWeight.w400,
                          color: AppColor.lowText,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 21 * fem, 0 * fem),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Còn lại: ${product.quantity}',
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2 * ffem / fem,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    product.storeName.toString().toUpperCase(),
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontFamily: 'Solway',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2 * ffem / fem,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              BlocBuilder<StoreBloc, StoreState>(
                builder: (context, state) {
                  if (state is StoreLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ),
                    );
                  }
                  if (state is StoreByIdLoadedState) {
                    return Container(
                        width: 170 * fem,
                        height: 100 * fem,
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 10 * fem, 150 * fem, 0 * fem),
                        child: Image.network('${state.storeModel.coverPhoto}'));
                  }

                  return Container();
                },
              ),
              BlocBuilder<StoreBloc, StoreState>(
                builder: (context, state) {
                 if (state is StoreLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ),
                    );
                  }
                  if (state is StoreByIdLoadedState) {
                    return Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 15 * fem, 0 * fem, 0 * fem),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        state.storeModel.address.toString(),
                        style: TextStyle(
                          fontFamily: 'Solway',
                          fontSize: 14 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2 * ffem / fem,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                  }

                  return Container();
                },
              ),
              ButtonAddToCart(
                fem: fem,
                ffem: ffem,
                product: product,
              )
            ],
          ),
        ),
      ),
    );
  }

  String changeCurrency(double price) {
    return price.isNaN
        ? "0"
        : NumberFormat.currency(locale: 'vi').format(price);
  }
}
