import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CustomerModel extends Equatable {
  final int id;
  final String userName;
  String? fullName;
  final String email;
  String? phone;
  String? avatar;
  String? dob;
  String? address;
  bool? state;
  int? cityId;
  String? cityName;
  bool? status;

  CustomerModel(
      {required this.id,
      required this.userName,
      this.fullName,
      required this.email,
      this.phone,
      this.avatar,
      this.dob,
      this.address,
      this.state,
      this.cityId,
      this.cityName,
      this.status});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
        id: json['id'],
        userName: json['userName'],
        fullName: json['fullName'],
        email: json['email'],
        phone: json['phone'],
        avatar: json['avatar'],
        dob: json['dob'],
        address: json['address'],
        state: json['state'],
        cityId: json['cityId'],
        cityName: json['cityName'],
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  List<Object?> get props => [id, userName, fullName, email, phone, avatar, dob, address, state, cityId, cityName, status];
}
