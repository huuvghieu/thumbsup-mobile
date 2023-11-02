part of 'state_bloc.dart';

abstract class StateState extends Equatable {
  const StateState();
}

class StateLoadingState extends StateState {
  @override
  List<Object> get props => [];
}

class StateLoadedState extends StateState {
  const StateLoadedState(this.stateModels);
  final List<StateModel> stateModels;

  @override
  List<Object> get props => [stateModels];
}

class StateErrorState extends StateState {
  const StateErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}