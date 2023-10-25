class WishListStoreModel {
  final int id;
  final int customerId;
  String? customerName;
  int? storeId;
  String? storeName;
  String? storeImageCover;
  String? storeImageLogo;
  int? numofFollowing;
  double? rating;
  int? numOfRating;
  bool? favor;
  bool? status;
  Object? cateList;

  WishListStoreModel(
      {required this.id,
      required this.customerId,
      this.customerName,
      this.storeId,
      this.storeName,
      this.storeImageCover,
      this.storeImageLogo,
      this.cateList,
      this.numofFollowing,
      this.rating,
      this.numOfRating,
      this.favor,
      this.status});

  factory WishListStoreModel.fromJson(Map<String, dynamic> json) {
    return WishListStoreModel(
        id: json['id'],
        customerId: json['customerId'],
        customerName: json['customerName'],
        storeId: json['storeId'],
        storeName: json['storeName'],
        storeImageCover: json['storeImageCover'],
        storeImageLogo: json['storeImageLogo'],
        cateList: json['cateList'],
        rating: (json['rating'] as num).toDouble(),
        numOfRating: (json['numOfRating'] as num).toInt(),
        numofFollowing: (json['numOfFollowing'] as num).toInt(),
        favor: json['favor'],
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['storeId'] = this.storeId;
    data['storeName'] = this.storeName;
    data['storeImageCover'] = this.storeImageCover;
    data['storeImageLogo'] = this.storeImageLogo;
    data['cateList'] = this.cateList;
    data['rating'] = this.rating;
    data['numOfRating'] = this.numOfRating;
    data['numOfFollowing'] = this.numofFollowing;
    data['favor'] = this.favor;
    data['status'] = this.status;
    return data;
  }
}
