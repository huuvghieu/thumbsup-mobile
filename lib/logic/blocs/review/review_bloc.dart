import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/review_model.dart';
import 'package:my_app/data/repositories/review_repository.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final ReviewRepository repository;
  ReviewBloc({required this.repository}) : super(ReviewLoadingState()) {
    on<ReviewEvent>((event, emit) {
      emit(ReviewLoadingState());

      try {
        emit(const ReviewLoadedState());
      } catch (e) {
        emit(ReviewErrorState(e.toString()));
      }
    });
    on<AddReviewEvent>(_onAddReview);
  }

  Future<void> _onAddReview(
      AddReviewEvent event, Emitter<ReviewState> emit) async {
    try {
      ReviewModel review = ReviewModel(
          comment: event.comment,
          customerId: event.customerId,
          productId: event.productId,
          rating: event.rating,
          state: event.state);
      bool result = await repository.createReview(review);
      if (result) {
        emit(const ReviewSuccessState());
      } else {
        emit(ReviewErrorState('Thêm thất bại'));
      }
    } catch (e) {
      emit(ReviewErrorState(e.toString()));
    }
  }
}
