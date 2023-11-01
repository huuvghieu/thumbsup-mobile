class CityModel {
  final int id;
  final String cityName;
  String? image;
  String? description;
  bool? status;

  CityModel(
      {required this.id,
      required this.cityName,
      this.image,
      this.description,
      this.status});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'],
      cityName: json['cityName'],
      image: json['image'],
      description: json['description'],
      status: json['status']
    );
  }
}
