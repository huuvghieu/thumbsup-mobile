import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/data/models/price_model.dart';
import 'package:my_app/logic/blocs/filters/filters_bloc.dart';
import 'package:my_app/screens/product/search/components/custom_brand_filter.dart';
import 'package:my_app/screens/product/search/components/custom_category_filter.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Bộ lọc",
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: AppColor.primary,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const Icon(
              Icons.filter_alt_sharp,
              size: 30.0,
            ),
          )
        ],
      ),
      bottomNavigationBar:
          BottomAppBar(child: BlocBuilder<FiltersBloc, FiltersState>(
        builder: (context, state) {
          if (state is FiltersLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            );
          }
          if (state is FiltersLoaded) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primaryDark,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(12.0)),
              child: const Text(
                'Xác nhận',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/product-list-screen',
                    arguments: [state.categories, state.brands,
                    state.filter.priceFilter.priceStart,
                    state.filter.priceFilter.priceEnd
                    ]);
              },
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      )),
      body: const SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  "Giá cả",
                  style: TextStyle(
                    color: AppColor.primaryDark,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  CustomPriceFilter(),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  "Thể loại",
                  style: TextStyle(
                    color: AppColor.primaryDark,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  CustomCategoryFilter(),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
              child: ExpansionTile(
                title: Text(
                  "Thương hiệu",
                  style: TextStyle(
                    color: AppColor.primaryDark,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  CustomBrandFilter(),
                ],
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}

class CustomPriceFilter extends StatefulWidget {
  const CustomPriceFilter({super.key});

  @override
  State<CustomPriceFilter> createState() => _CustomPriceFilterState();
}

class _CustomPriceFilterState extends State<CustomPriceFilter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(builder: (context, state) {
      if (state is FiltersLoading) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppColor.primary,
          ),
        );
      }
      if (state is FiltersLoaded) {
        RangeValues currentRangeValues = RangeValues(
            state.filter.priceFilter.priceStart.price,
            state.filter.priceFilter.priceEnd.price);
        return Column(
          children: [
            RangeSlider(
              activeColor: AppColor.primary,
              // inactiveColor: AppColor.lowText,
              values: currentRangeValues,
              max: 50000000,
              divisions: 1000,
              labels: RangeLabels(
                currentRangeValues.start.round().toString(),
                currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                context.read<FiltersBloc>().add(PriceFilterUpdated(
                    priceFilter: state.filter.priceFilter.copyWith(
                        priceStart: PriceModel(id: 1, price: values.start),
                        priceEnd: PriceModel(id: 2, price: values.end))));
              },
            ),
            Text(
              "Giá: ${changeCurrency(currentRangeValues.start.round())} "
              "- ${changeCurrency(currentRangeValues.end.round())}",
              style: const TextStyle(fontSize: 20.0, color: AppColor.lowText),
            ),
          ],
        );
      } else {
        return const Text("Something went wrong!");
      }
    });
  }

  String changeCurrency(int price) {
    return price.isNaN
        ? "0"
        : NumberFormat.simpleCurrency(locale: 'vi-VN').format(price);
  }
}
