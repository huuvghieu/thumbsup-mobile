class Customer {
  int? id;
  String? userName;
  String? fullName;
  String? email;
  String? phone;
  String? avatar;
  String? dob;
  String? address;
  bool? state;
  int? cityId;
  String? cityName;
  bool? status;

  Customer(
      {this.id,
      this.userName,
      this.fullName,
      this.email,
      this.phone,
      this.avatar,
      this.dob,
      this.address,
      this.state,
      this.cityId,
      this.cityName,
      this.status});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    fullName = json['fullName'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    dob = json['dob'];
    address = json['address'];
    state = json['state'];
    cityId = json['cityId'];
    cityName = json['cityName'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['dob'] = dob;
    data['address'] = address;
    data['state'] = state;
    data['cityId'] = cityId;
    data['cityName'] = cityName;
    data['status'] = status;
    return data;
  }

  @override
  String toString() {
    return fullName.toString();
  }
}
