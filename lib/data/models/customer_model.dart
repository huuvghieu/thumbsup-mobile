import 'package:equatable/equatable.dart';

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
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['dob'] = this.dob;
    data['address'] = this.address;
    data['state'] = this.state;
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    data['status'] = this.status;
    return data;
  }
  
  @override
  List<Object?> get props => [id, userName, fullName, email, phone, avatar, dob, address, state, cityId, cityName, status];
}
