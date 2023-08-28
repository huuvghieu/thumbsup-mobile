import 'package:my_app/model/brand.dart';

class BrandFilter {
  int id;
  Brand brand;
  bool value;

  BrandFilter({required this.id, required this.brand, required this.value});

  BrandFilter copyWith({
    int? id,
    Brand? brand,
    bool? value,
  }) {
    return BrandFilter(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      value: value ?? this.value,
    );
  }

  static List<BrandFilter> filters = Brand.brands
      .map((brand) => BrandFilter(id: brand.id, brand: brand, value: false))
      .toList();
}
