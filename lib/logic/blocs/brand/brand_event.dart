part of 'brand_bloc.dart';

sealed class BrandEvent extends Equatable {
  const BrandEvent();
}

class LoadBrandEvent extends BrandEvent {
  const LoadBrandEvent();

  @override
  List<Object?> get props => [];
}
