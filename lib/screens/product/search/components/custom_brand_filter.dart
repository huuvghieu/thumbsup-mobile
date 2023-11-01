import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/logic/blocs/filters/filters_bloc.dart';

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
                            isSelected:
                                !state.filter.brandFilters[index].isSelected),
                      ));
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 5.0),
                  decoration: BoxDecoration(
                      color: state.filter.brandFilters[index].isSelected
                          ? AppColor.primary
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.filter.brandFilters[index].brandModel.brand,
                        style: const TextStyle(
                            fontSize: 18.0, color: AppColor.lowText),
                      ),
                      SizedBox(
                          height: 25.0,
                          child: Checkbox(
                              value:
                                  state.filter.brandFilters[index].isSelected,
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
                                              isSelected: !state
                                                  .filter
                                                  .brandFilters[index]
                                                  .isSelected),
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