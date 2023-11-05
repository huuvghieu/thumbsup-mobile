part of 'autocomplete_bloc.dart';

abstract class AutocompleteState extends Equatable {
  const AutocompleteState();
}
class AutocompleteLoading extends AutocompleteState {
  @override
  List<Object?> get props => [];
}

class AutocompleteLoaded extends AutocompleteState {
  final List<PlaceAutocomplete> autocomplete;

  const AutocompleteLoaded({required this.autocomplete});

  @override
  List<Object> get props => [autocomplete];
}

class AutocompleteError extends AutocompleteState {
  @override
  List<Object?> get props => [];
}
