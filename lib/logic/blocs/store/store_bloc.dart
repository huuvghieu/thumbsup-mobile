import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_app/data/models/store_model.dart';
import 'package:my_app/data/repositories/store_repository.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository _storeRepository;
  int? id;
  StoreBloc(this._storeRepository, this.id) : super(StoreLoadingState()) {
    on<LoadStoreByIdEvent>((event, emit) async {
      emit(StoreLoadingState());

      try {
        final store = await _storeRepository.getServiceProductById(id!);
        emit(StoreByIdLoadedState(store!));
      } catch (e) {
        emit(StoreErrorState(e.toString()));
      }
    });
  }

}
