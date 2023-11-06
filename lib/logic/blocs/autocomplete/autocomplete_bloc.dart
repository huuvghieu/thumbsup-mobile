import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/data/models/place_autocomplete.dart';
import 'package:my_app/data/repositories/place_repository.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository placesRepository;
  AutocompleteBloc({
    required this.placesRepository
  }) : super(AutocompleteLoading()) {
    on<LoadAutocomplete>(_onLoadAutocomplete);
    on<ClearAutocomplete>(_onClearAutocomplete);
  }
    void _onLoadAutocomplete(
    LoadAutocomplete event,
    Emitter<AutocompleteState> emit,
  ) async {
    final List<PlaceAutocomplete> autocomplete =
        await placesRepository.getAutocomplete(event.searchInput);

    emit(AutocompleteLoaded(autocomplete: autocomplete));
  }

  void _onClearAutocomplete(
    ClearAutocomplete event,
    Emitter<AutocompleteState> emit,
  ) async {
    emit(AutocompleteLoaded(autocomplete: List.empty()));
  }
}
