part of 'place_bloc.dart';

abstract class PlaceEvent extends Equatable {
  const PlaceEvent();
}

class LoadPlace extends PlaceEvent {
  final String placeId;

  const LoadPlace({required this.placeId});
  
  @override
  List<Object?> get props => [];
}
