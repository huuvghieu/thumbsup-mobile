import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/brand_model.dart';

class BrandFilterModel extends Equatable {
  final int id;
  final BrandModel brandModel;
  final bool isSelected;

  BrandFilterModel({
    required this.id,
    required this.brandModel,
    required this.isSelected,
  });

  BrandFilterModel copyWith(
      {int? id, BrandModel? brandModel, bool? isSelected}) {
    return BrandFilterModel(
        id: id ?? this.id,
        brandModel: brandModel ?? this.brandModel,
        isSelected: isSelected ?? this.isSelected);
  }

  // static List<BrandFilterModel> filters = BrandModel.brands
  //     .map((brand) => BrandFilterModel(
  //         id: brand.id, brandModel: brand, isSelected: false))
  //     .toList();
  static List<BrandFilterModel> filters = [];
  @override
  List<Object?> get props => [
        id, brandModel, isSelected
      ];
}
