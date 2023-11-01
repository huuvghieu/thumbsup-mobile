import 'package:equatable/equatable.dart';

class StateModel extends Equatable {
  final int id;
  String? state;
  String? description;

  StateModel({
    required this.id,
    this.state,
    this.description,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'],
      state: json['state'],
      description: json['description']
    );
  }
  
  @override
  List<Object?> get props => [id, state, description];
}
