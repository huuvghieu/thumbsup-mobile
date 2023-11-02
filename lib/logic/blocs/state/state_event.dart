part of 'state_bloc.dart';

abstract class StateEvent extends Equatable {
  const StateEvent();
}


class LoadStateEvent extends StateEvent {
  const LoadStateEvent();

  @override
  List<Object?> get props => [];
}
