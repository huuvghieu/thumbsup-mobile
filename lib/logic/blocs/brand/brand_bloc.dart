import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/data/models/brand_model.dart';
import 'package:my_app/data/repositories/brand_repository.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandRepository _brandRepository;
  BrandBloc(this._brandRepository) : super(BrandLoadingState()) {
    on<LoadBrandEvent>((event, emit) async {
      emit(BrandLoadingState());

      try {
        final brands = await _brandRepository.getBrands();
        emit(BrandLoadedState(brands!));
      } catch (e) {
        emit(BrandErrorState(e.toString()));
      }
    });
  }
}
