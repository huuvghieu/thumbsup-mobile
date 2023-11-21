part of 'wish_list_store_bloc.dart';

@immutable
abstract class WishListStoreState extends Equatable {
  const WishListStoreState();
}

class WishListStoreLoadingState extends WishListStoreState {
  @override
  List<Object?> get props => [];
}

class WishListStoreLoadedState extends WishListStoreState {
  final List<WishListStoreModel> wishLists;

  const WishListStoreLoadedState({required this.wishLists});

  @override
  List<Object?> get props => [wishLists];
}

// ignore: must_be_immutable
class WishListStoreErrorState extends WishListStoreState {
  String? error;
  WishListStoreErrorState(this.error);
  @override
  List<Object?> get props => [error];
}