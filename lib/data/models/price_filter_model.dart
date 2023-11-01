import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/price_model.dart';
import 'package:my_app/filter/price_filter_model.dart';

class PriceFilterModel extends Equatable {
  final int id;
  final PriceModel priceStart;
  final PriceModel priceEnd;
  final bool isSelected;

  const PriceFilterModel(
      {required this.id,
      required this.priceStart,
      required this.priceEnd,
      required this.isSelected});

  PriceFilterModel copyWith(
      {int? id, PriceModel? priceStart, PriceModel? priceEnd, bool? isSelected}) {
    return PriceFilterModel(
        id: id ?? this.id,
        priceStart: priceStart ?? this.priceStart,
        priceEnd: priceEnd ?? this.priceEnd,
        isSelected: isSelected ?? this.isSelected);
  }

  static PriceFilterModel filter = PriceFilterModel(
      id: 1,
      priceStart: PriceModel(id: 1, price: 0),
      priceEnd: PriceModel(id: 2, price: 25000000),
      isSelected: false);
      
        @override
        List<Object?> get props => [id, priceStart, priceEnd, isSelected];
}
