part of 'autocomplete_bloc.dart';

abstract class AutocompleteEvent extends Equatable {
  const AutocompleteEvent();
}

class LoadAutocomplete extends AutocompleteEvent {
  final String searchInput;

  const LoadAutocomplete({this.searchInput = ''});

  @override
  List<Object> get props => [searchInput];
}

class ClearAutocomplete extends AutocompleteEvent {
  @override
  List<Object?> get props => [];
}