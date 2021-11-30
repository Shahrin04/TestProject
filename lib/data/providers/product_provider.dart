import 'package:test_project/common%20files/product_json.dart';
import 'package:test_project/data/models/product.dart';

class ProductProvider {
  List<Product> fetchProducts() {
    try {
      Future.delayed(const Duration(seconds: 1));
      List<Product> list = [];
      for (var element in ProductJson.productList) {
        list.add(Product.fromMap(element));
      }
      return list;
    } on Exception catch (e) {
      print('Product Provider Error: ' + e.toString());
      return null;
    }
  }
}
