part of 'city_bloc.dart';

sealed class CityState extends Equatable {
  const CityState();
}

class CityLoadingState extends CityState {
  @override
  List<Object> get props => [];
}

class CityLoadedState extends CityState {
  CityLoadedState(this.cityModels);
  final List<CityModel> cityModels;

  @override
  List<Object> get props => [cityModels];
}

class CityErrorState extends CityState {
  CityErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

