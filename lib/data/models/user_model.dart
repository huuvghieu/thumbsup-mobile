import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String? name;
  final String? email;
  final String? photo;

  const UserModel({required this.id, this.name, this.email, this.photo});

  static const empty = UserModel(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == UserModel.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != UserModel.empty;

  @override
  List<Object?> get props => [id, email, name, photo];
}
