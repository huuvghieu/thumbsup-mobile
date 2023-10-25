part of 'store_bloc.dart';

@immutable
abstract class StoreEvent extends Equatable {
  const StoreEvent();
}

class LoadStoreByIdEvent extends StoreEvent {
  const LoadStoreByIdEvent();

  @override
  List<Object?> get props => [];
}
