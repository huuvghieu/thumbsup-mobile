class StoreExtra {
  int? id;
  String? userName;
  String? storeName;
  String? email;
  String? phone;
  String? logo;
  String? coverPhoto;
  String? address;
  double? balance;
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

  StoreExtra(
      {this.id,
        this.userName,
        this.storeName,
        this.email,
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

  StoreExtra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    storeName = json['storeName'];
    email = json['email'];
    phone = json['phone'];
    logo = json['logo'];
    coverPhoto = json['coverPhoto'];
    address = json['address'];
    balance = json['balance'];
    dateCreated = json['dateCreated'];
    openingHours = json['openingHours'];
    closingHours = json['closingHours'];
    description = json['description'];
    state = json['state'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    numOfFollowing = json['numOfFollowing'];
    numOfRating = json['numOfRating'];
    rating = json['rating'];
    favor = json['favor'];
    cateList = json['cateList'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['storeName'] = storeName;
    data['email'] = email;
    data['phone'] = phone;
    data['logo'] = logo;
    data['coverPhoto'] = coverPhoto;
    data['address'] = address;
    data['balance'] = balance;
    data['dateCreated'] = dateCreated;
    data['openingHours'] = openingHours;
    data['closingHours'] = closingHours;
    data['description'] = description;
    data['state'] = state;
    data['cityId'] = cityId;
    data['cityName'] = cityName;
    data['numOfFollowing'] = numOfFollowing;
    data['numOfRating'] = numOfRating;
    data['rating'] = rating;
    data['favor'] = favor;
    data['cateList'] = cateList;
    data['status'] = status;
    return data;
  }
}