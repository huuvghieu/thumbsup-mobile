part of 'place_bloc.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();
}

class PlaceLoading extends PlaceState {
  @override
  List<Object?> get props => [];
}

class PlaceLoaded extends PlaceState {
  final Place place;

  const PlaceLoaded({required this.place});
  
  @override
  List<Object?> get props => [place];

}


class PlaceErrior extends PlaceState {
  @override
  List<Object?> get props => [];
}
