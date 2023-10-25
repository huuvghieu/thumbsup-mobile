import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/data/models/store_model.dart';
import 'package:my_app/data/models/wish_list_store_model.dart';
import 'package:my_app/data/repositories/wishlist_store_repository.dart';

part 'wish_list_store_event.dart';
part 'wish_list_store_state.dart';

class WishListStoreBloc extends Bloc<WishListStoreEvent, WishListStoreState> {
  final WishListStoreRepository _wishListRepository;
  WishListStoreBloc(this._wishListRepository) : super(WishListStoreLoadingState()) {
    on<StartWishListStoreEvent>(_onStartWishList);
    // on<AddWishListProductEvent>(_onAddWishList());
    // on<RemoveWishListProductEvent>(_onRemoveWishList());
  }

   Future<void> _onStartWishList(
      StartWishListStoreEvent event, Emitter<WishListStoreState> emit) async {
    emit(WishListStoreLoadingState());
    try {
      final wishListStore = await _wishListRepository.getWishListStores();
      emit(WishListStoreLoadedState(wishLists: wishListStore));
    } catch (e) {
      emit(WishListStoreErrorState(e.toString()));
      ;
    }
  }
}
