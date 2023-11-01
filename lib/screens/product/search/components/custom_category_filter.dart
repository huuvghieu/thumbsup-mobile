import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/common/color.dart';
import 'package:my_app/logic/blocs/filters/filters_bloc.dart';

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
                                  isSelected: !state.filter
                                      .categoryFilters[index].isSelected),
                        ));
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        color: state.filter.categoryFilters[index].isSelected
                            ? AppColor.primary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.filter.categoryFilters[index].categoryModel
                              .category,
                          style: const TextStyle(
                              fontSize: 18.0, color: AppColor.lowText),
                        ),
                        SizedBox(
                            height: 25.0,
                            child: Checkbox(
                                value: state
                                    .filter.categoryFilters[index].isSelected,
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
                                                isSelected: !state
                                                    .filter
                                                    .categoryFilters[index]
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
      },
    );
  }
}
