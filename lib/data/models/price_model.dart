import 'package:equatable/equatable.dart';

class PriceModel extends Equatable {
  final int id;
  final double price;

  PriceModel({
    required this.id,
    required this.price,
  });
  
  @override
  List<Object?> get props => [id, price];
}
