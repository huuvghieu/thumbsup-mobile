import 'package:my_app/data/models/sort_model.dart';

class PageableModel {
  int? pageNumber;
  int? pageSize;
  SortModel? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  PageableModel({
    this.pageNumber,
    this.pageSize,
    this.sort,
    this.offset,
    this.paged,
    this.unpaged,
  });

  factory PageableModel.fromJson(Map<String, dynamic> json) {
    return PageableModel(
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      sort: SortModel.fromJson(json['sort']),
      offset: json['offset'],
      paged: json['paged'],
      unpaged: json['unpaged'],
    );
  }
}
