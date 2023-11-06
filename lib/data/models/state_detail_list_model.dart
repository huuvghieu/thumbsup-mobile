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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['stateId'] = stateId;
    data['stateName'] = stateName;
    data['orderId'] = orderId;
    data['status'] = status;
    return data;
  }

  @override
  List<Object?> get props => [id, date, stateId, stateName, orderId, status];
}
