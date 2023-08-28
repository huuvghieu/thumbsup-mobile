class Category {
  int id;
  String name;

  Category({required this.id, required this.name});

  static List<Category> categories = [
    Category(id: 1, name: "Laptop"),
    Category(id: 2, name: "Tai nghe"),
    Category(id: 3, name: "Đồng hồ"),
    Category(id: 4, name: "Chuột"),
    Category(id: 5, name: "Bàn phím"),
    Category(id: 6, name: "Loa"),
    Category(id: 7, name: "Bộ sạc"),
    Category(id: 8, name: "USB"),
  ];
}
