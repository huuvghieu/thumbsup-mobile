part of 'city_bloc.dart';

sealed class CityEvent extends Equatable {
  const CityEvent();
}
class LoadCityEvent extends CityEvent {
  const LoadCityEvent();

  @override
  List<Object?> get props => [];
}
