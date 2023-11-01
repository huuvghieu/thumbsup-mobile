import 'package:equatable/equatable.dart';

class StateDetailListModel extends Equatable {
  final int id;
  String? date;
  int? stateId;
  String? stateName;
  int? orderId;
  bool? status;

  StateDetailListModel(
      {required this.id,
      this.date,
      this.stateId,
      this.stateName,
      this.orderId,
      this.status});

  factory StateDetailListModel.fromJson(Map<String, dynamic> json) {
    return StateDetailListModel(
        id: json['id'],
        date: json['date'],
        stateId: json['stateId'],
        stateName: json['stateName'],
        orderId: json['orderId'],
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['stateId'] = this.stateId;
    data['stateName'] = this.stateName;
    data['orderId'] = this.orderId;
    data['status'] = this.status;
    return data;
  }

  @override
  List<Object?> get props => [id, date, stateId, stateName, orderId, status];
}
