part of 'brand_bloc.dart';

@immutable
abstract class BrandState extends Equatable {
  const BrandState();
}

class BrandLoadingState extends BrandState {
  @override
  List<Object> get props => [];
}

class BrandLoadedState extends BrandState {
  const BrandLoadedState(this.brandModels);
  final List<BrandModel> brandModels;

  @override
  List<Object> get props => [brandModels];
}

class BrandErrorState extends BrandState {
  const BrandErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}