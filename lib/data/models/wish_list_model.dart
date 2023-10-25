class WishListProductModel{
  final int id;
  final int customerId;
  String? customerName;
  int? storeId;
  String? storeName;
  int? productId;
  String? productName;
  String? productImage;
  double? rating;
  int? numOfRating;
  bool? favor;
  bool? status;

  WishListProductModel(
      {
      required this.id,
      required this.customerId,
      this.customerName,
      this.storeId,
      this.storeName,
      this.productId,
      this.productName,
      this.productImage,
      this.rating,
      this.numOfRating,
      this.favor,
      this.status});

  factory WishListProductModel.fromJson(Map<String, dynamic> json){
    return WishListProductModel(
    id : json['id'],
    customerId : json['customerId'],
    customerName : json['customerName'],
    storeId : json['storeId'],
    storeName : json['storeName'],
    productId : json['productId'],
    productName : json['productName'],
    productImage : json['productImage'],
    rating : (json['rating'] as num).toDouble(),
    numOfRating : (json['numOfRating'] as num).toInt(),
    favor : json['favor'],
    status : json['status']
    );
  }

    Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['storeId'] = this.storeId;
    data['storeName'] = this.storeName;
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productImage'] = this.productImage;
    data['rating'] = this.rating;
    data['numOfRating'] = this.numOfRating;
    data['favor'] = this.favor;
    data['status'] = this.status;
    return data;
  }
}
