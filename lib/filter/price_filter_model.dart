import 'package:my_app/model/price.dart';

class PriceFilter {
  int id;
  Price priceStart;
  Price priceEnd;
  bool value;

  PriceFilter({required this.id, required this.priceStart, required this.priceEnd, required this.value});

  PriceFilter copyWith({
    int? id,
    Price? priceStart,
    Price? priceEnd,
    bool? value,
  }) {
    return PriceFilter(
      id: id ?? this.id,
      priceStart: priceStart ?? this.priceStart,
      priceEnd: priceEnd ?? this.priceEnd,
      value: value ?? this.value,
    );
  }

  static PriceFilter filter = PriceFilter(id: 1, priceStart: Price(id: 1, price: 0), priceEnd: Price(id: 2, price: 25000000), value: false);
}
