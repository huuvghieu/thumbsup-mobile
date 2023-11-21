part of 'wishlist_bloc.dart';

@immutable
abstract class WishListState extends Equatable {
  const WishListState();
}

class WishListLoadingState extends WishListState {
  @override
  List<Object?> get props => [];
}

class WishListLoadedState extends WishListState {
  final List<WishListProductModel> wishLists;

  const WishListLoadedState({required this.wishLists});

  @override
  List<Object?> get props => [wishLists];
}


class AddWishListSuccessState extends WishListState {

  const AddWishListSuccessState();

  @override
  List<Object?> get props => [];
}

class RemoveWishListSuccessState extends WishListState {

  const RemoveWishListSuccessState();

  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class WishListErrorState extends WishListState {
  String? error;
  WishListErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
