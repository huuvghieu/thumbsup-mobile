part of 'review_bloc.dart';

sealed class ReviewState extends Equatable {
  const ReviewState();
}

class ReviewLoadingState extends ReviewState {
  @override
  List<Object> get props => [];
}

class ReviewLoadedState extends ReviewState {
  const ReviewLoadedState();

  @override
  List<Object> get props => [];
}

class ReviewErrorState extends ReviewState {
  const ReviewErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}


class ReviewSuccessState extends ReviewState {
  const ReviewSuccessState();

  @override
  List<Object?> get props => [];
}