part of 'review_bloc.dart';

sealed class ReviewEvent extends Equatable {
  const ReviewEvent();
}

class LoadReviewEvent extends ReviewEvent {
  const LoadReviewEvent();

  @override
  List<Object?> get props => [];
}

class AddReviewEvent extends ReviewEvent {
  final String? comment;
  final int? rating;
  final bool? state;
  final int? customerId;
  final int? productId;

  const AddReviewEvent({this.comment, this.state, this.rating, this.customerId, this.productId});
  
  @override
  List<Object?> get props => [comment, state, rating, customerId, productId];

}

