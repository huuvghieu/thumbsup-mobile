class Product {
  int? id;
  String? name;
  double? unitPrice;
  int? quantity;
  String? image;
  String? description;
  bool? status;

  Product(
      {required this.id,
      required this.name,
      required this.unitPrice,
      required this.quantity,
      required this.image,
      required this.description,
      required this.status});

  Product.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    name = json['name'];
    unitPrice = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    description = json['description'];
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
    data['status'] = status;
    return data;
  }
}
