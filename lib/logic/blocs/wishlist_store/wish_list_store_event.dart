part of 'wish_list_store_bloc.dart';
@immutable
abstract class WishListStoreEvent extends Equatable {
  const WishListStoreEvent();
}

class StartWishListStoreEvent extends WishListStoreEvent {
  const StartWishListStoreEvent();
  @override
  List<Object?> get props => [];
}

class AddWishListStoreEvent extends WishListStoreEvent {
  final StoreModel storeModel;

  const AddWishListStoreEvent(this.storeModel);

  @override
  List<Object?> get props => [storeModel];
}

class RemoveWishListStoreEvent extends WishListStoreEvent {
  final StoreModel storeModel;

  const RemoveWishListStoreEvent(this.storeModel);

  @override
  List<Object?> get props => [storeModel];
}
