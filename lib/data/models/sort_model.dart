class SortModel {
  bool? empty;
  bool? storted;
  bool? unstored;

  SortModel({this.empty, this.storted, this.unstored});

  factory SortModel.fromJson(Map<String, dynamic> json) {
    return SortModel(
        empty: json['empty'],
        storted: json['storted'],
        unstored: json['unstored']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empty'] = this.empty;
    data['storted'] = this.storted;
    data['unstored'] = this.unstored;
    return data;
  }
}
