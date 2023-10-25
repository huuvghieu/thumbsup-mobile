part of 'wishlist_bloc.dart';

@immutable
abstract class WishListEvent extends Equatable {
  const WishListEvent();
}

class StartWishListEvent extends WishListEvent {
  const StartWishListEvent();
  @override
  List<Object?> get props => [];
}

class AddWishListProductEvent extends WishListEvent {
  final ProductModel productModel;

  const AddWishListProductEvent(this.productModel);

  @override
  List<Object?> get props => [productModel];
}

class RemoveWishListProductEvent extends WishListEvent {
  final ProductModel productModel;

  const RemoveWishListProductEvent(this.productModel);

  @override
  List<Object?> get props => [productModel];
}
