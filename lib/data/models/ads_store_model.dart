class AdsStoreModel {
  final int id;
  final String userName;
  final String storeName;
  final String email;
  String? phone;
  String? logo;
  String? coverPhoto;
  String? address;
  int? balance;
  String? dateCreated;
  String? openingHours;
  String? closingHours;
  String? description;
  bool? state;
  int? cityId;
  String? cityName;
  int? numOfFollowing;
  int? numOfRating;
  double? rating;
  bool? favor;
  List<String>? cateList;
  bool? status;

  AdsStoreModel(
      {required this.id,
      required this.userName,
      required this.storeName,
      required this.email,
      this.phone,
      this.logo,
      this.coverPhoto,
      this.address,
      this.balance,
      this.dateCreated,
      this.openingHours,
      this.closingHours,
      this.description,
      this.state,
      this.cityId,
      this.cityName,
      this.numOfFollowing,
      this.numOfRating,
      this.rating,
      this.favor,
      this.cateList,
      this.status});

  factory AdsStoreModel.fromJson(Map<String, dynamic> json) {
    return AdsStoreModel(
      id: json['id'],
      userName: json['userName'],
      storeName: json['storeName'],
      email: json['email'],
      phone: json['phone'],
      logo: json['logo'],
      coverPhoto: json['coverPhoto'],
      address: json['address'],
      balance: (json['balance'] as num).toInt(),
      dateCreated: json['dateCreated'],
      openingHours: json['openingHours'],
      closingHours: json['closingHours'],
      description: json['description'],
      state: json['state'],
      cityId: json['cityId'],
      cityName: json['cityName'],
      numOfFollowing: (json['numOfFollowing'] as num).toInt(),
      numOfRating: (json['numOfRating'] as num).toInt(),
      rating: json['rating'],
      favor: json['favor'],
      cateList : json['cateList'].cast<String>(),
      status: json['status'],
    );
  }
}
