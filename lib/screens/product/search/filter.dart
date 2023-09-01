import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_app/blocs/filters/filters_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/model/price.dart';

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
                // print(state.filteredRestaurants);
                // Navigator.pushNamed(
                //   context,
                //   '/restaurant-listing',
                //   arguments: state.filteredRestaurants,
                // );
              },
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      )),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
              child: Text(
                "Giá cả",
                style: TextStyle(
                  color: AppColor.primaryDark,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomPriceFilter(),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
              child: Text(
                "Thể loại",
                style: TextStyle(
                  color: AppColor.primaryDark,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomCategoryFilter(),
            SizedBox(height: 30.0),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
              child: Text(
                "Thương hiệu",
                style: TextStyle(
                  color: AppColor.primaryDark,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CustomBrandFilter(),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }
}

class CustomBrandFilter extends StatelessWidget {
  const CustomBrandFilter({super.key});

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
        return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.filter.brandFilters.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<FiltersBloc>().add(BrandFilterUpdated(
                        brandFilter: state.filter.brandFilters[index].copyWith(
                            value: !state.filter.brandFilters[index].value),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      color: state.filter.brandFilters[index].value
                          ? AppColor.primary
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.filter.brandFilters[index].brand.brand,
                        style: const TextStyle(
                            fontSize: 18.0, color: AppColor.lowText),
                      ),
                      SizedBox(
                          height: 25.0,
                          child: Checkbox(
                              value: state.filter.brandFilters[index].value,
                              activeColor: Colors.white,
                              checkColor: AppColor.primaryDark,
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    width: 1.0, color: AppColor.lowText),
                              ),
                              onChanged: (bool? newValue) {
                                context
                                    .read<FiltersBloc>()
                                    .add(BrandFilterUpdated(
                                      brandFilter: state
                                          .filter.brandFilters[index]
                                          .copyWith(
                                              value: !state.filter
                                                  .brandFilters[index].value),
                                    ));
                              })),
                    ],
                  ),
                ),
              );
            });
      } else {
        return const Text("Something went wrong!");
      }
    });
  }
}

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is FiltersLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.primary,
            ),
          );
        }
        if (state is FiltersLoaded) {
          return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.filter.categoryFilters.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<FiltersBloc>().add(CategoryFilterUpdated(
                          categoryFilter: state.filter.categoryFilters[index]
                              .copyWith(
                                  value: !state
                                      .filter.categoryFilters[index].value),
                        ));
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: state.filter.categoryFilters[index].value
                            ? AppColor.primary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.filter.categoryFilters[index].category.name,
                          style: const TextStyle(
                              fontSize: 18.0, color: AppColor.lowText),
                        ),
                        SizedBox(
                            height: 25.0,
                            child: Checkbox(
                                value:
                                    state.filter.categoryFilters[index].value,
                                activeColor: Colors.white,
                                checkColor: AppColor.primaryDark,
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(
                                      width: 1.0, color: AppColor.lowText),
                                ),
                                onChanged: (bool? newValue) {
                                  context
                                      .read<FiltersBloc>()
                                      .add(CategoryFilterUpdated(
                                        categoryFilter: state
                                            .filter.categoryFilters[index]
                                            .copyWith(
                                                value: !state
                                                    .filter
                                                    .categoryFilters[index]
                                                    .value),
                                      ));
                                })),
                      ],
                    ),
                  ),
                );
              });
        } else {
          return const Text("Something went wrong!");
        }
      },
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
                context.read<FiltersBloc>().add(
                      PriceFilterUpdated(
                          priceFilter: state.filter.priceFilter.copyWith(
                              priceStart: Price(id: 1, price: values.start),
                              priceEnd: Price(id: 2, price: values.end))),
                    );
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
