class Product {
  int? id;
  String? name;
  num? unitPrice;
  int? quantity;
  String? image;
  String? description;
  String? store;
  bool? status;

  Product(
      {required this.id,
      required this.name,
      required this.unitPrice,
      required this.quantity,
      required this.image,
      required this.description,
      required this.store,
      required this.status});

  Product.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    name = json['name'];
    unitPrice = double.parse(json['unitPrice'].toString());
    quantity =  json['quantity'];
    image = json['image'];
    description = json['description'];
    store = json['store'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['unitPrice'] = unitPrice;
    data['quantity'] = quantity;
    data['image'] = image;
    data['description'] = description;
    data['store'] = store;
    data['status'] = status;
    return data;
  }
}
