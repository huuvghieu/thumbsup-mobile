import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetWorkHandler {
  static final storage = const FlutterSecureStorage();

  static void storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static void storeId(int? id) async {
    await storage.write(key: 'customerId', value: id.toString());
  }

  static Future<String?> getToken() async {
    // Read value
    String? value = await storage.read(key: 'token');
    return value;
  }
}
