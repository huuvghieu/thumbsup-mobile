import 'package:hive/hive.dart';
import 'package:my_app/data/models/product_model.dart';

class LocalStorageRepository{
    String boxName = 'cart_products';

  Future<Box> openBox() async {
    Box box = await Hive.openBox<ProductModel>(boxName);
    return box;
  }

  List<ProductModel> getCart(Box box) {
    return box.values.toList() as List<ProductModel>;
  }

  Future<void> addProductToCart(Box box, ProductModel product) async {
    await box.put(product.id, product);
  }

  Future<void> removeProductFromCart(Box box, ProductModel product) async {
    await box.delete(product.id);
  }

  Future<void> clearCart(Box box) async {
    await box.clear();
  }
}