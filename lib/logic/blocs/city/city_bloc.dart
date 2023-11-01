import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/city_model.dart';
import 'package:my_app/data/repositories/city_repository.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final CityRepository _cityRepository;
  CityBloc(this._cityRepository) : super(CityLoadingState()) {
    on<LoadCityEvent>((event, emit) async {
      emit(CityLoadingState());

      try {
        final cities = await _cityRepository.getCities();
        emit(CityLoadedState(cities!));
      } catch (e) {
        emit(CityErrorState(e.toString()));
      }
    });
  }
}
