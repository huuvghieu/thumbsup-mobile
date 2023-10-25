import 'package:my_app/data/models/pageable_model.dart';
import 'package:my_app/data/models/product_model.dart';
import 'package:my_app/data/models/sort_model.dart';

class ProductListModel {
  final List<ProductModel> products;
  final PageableModel pageable;
  bool? last;
  int? totalElements;
  int? totalPages;
  int? size;
  int? number;
  final SortModel sort;
  bool? first;
  int? numberOfElements;
  bool? empty;

  ProductListModel(
      {required this.products,
      required this.pageable,
      this.last,
      this.totalElements,
      this.totalPages,
      this.size,
      this.number,
      required this.sort,
      this.first,
      this.numberOfElements,
      this.empty});

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      products: parseProducts(json['content']),
      pageable: PageableModel.fromJson(json['pageable']),
      last: json['last'],
      totalElements: json['totalElements'],
      totalPages: json['totalPages'],
      size: json['size'],
      number: json['number'],
      sort: SortModel.fromJson(json['sort']),
      first: json['first'],
      numberOfElements: json['numberOfElements'],
      empty: json['empty']
    );
  }

  static List<ProductModel> parseProducts(List<dynamic> p) {
    return List.generate(p.length, (index) => ProductModel.fromJson(p[index]));
  }
}
