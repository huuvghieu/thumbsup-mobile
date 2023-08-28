class User {
  int id;
  String name;

  User({required this.id,required this.name});

  @override
  String toString() {
    return 'User { id: $id, name: $name }';
  }
}
