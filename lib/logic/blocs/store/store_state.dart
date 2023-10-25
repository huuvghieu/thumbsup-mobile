part of 'store_bloc.dart';
@immutable
abstract class StoreState extends Equatable {
}

class StoreLoadingState extends StoreState {
  @override
  List<Object> get props => [];
}

class StoreByIdLoadedState extends StoreState {
  StoreByIdLoadedState(this.storeModel);
  final StoreModel storeModel;

  @override
  List<Object> get props => [storeModel];
}

class StoreErrorState extends StoreState {
  StoreErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
