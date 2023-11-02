import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/state_model.dart';
import 'package:my_app/data/repositories/state_repository.dart';

part 'state_event.dart';
part 'state_state.dart';

class StateBloc extends Bloc<StateEvent, StateState> {
  final StateRepository _stateRepository;
  StateBloc(this._stateRepository) : super(StateLoadingState()) {
    on<LoadStateEvent>((event, emit) async {
      emit(StateLoadingState());

      try {
        final states = await _stateRepository.getStates();
        emit(StateLoadedState(states!));
      } catch (e) {
        emit(StateErrorState(e.toString()));
      }
    });
  }
}
