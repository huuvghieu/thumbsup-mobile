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
  final int customerId;
  final int productId;

  const AddWishListProductEvent({
    required this.customerId,
    required this.productId,
  });

  @override
  List<Object?> get props => [customerId, productId];
}

class RemoveWishListProductEvent extends WishListEvent {
  final int customerId;
  final int productId;

  const RemoveWishListProductEvent({
    required this.customerId,
    required this.productId,
  });

  @override
  List<Object?> get props => [customerId, productId];
}
