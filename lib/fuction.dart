import 'package:arhb_car_rental/model/product.dart';

List<Product> getProductByCategory(String kJackets, List<Product> allproducts) {
  List<Product> products = [];
  try {
    for (var product in allproducts) {
      if (product.pcatcory == kJackets) {
        products.add(product);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return products;
}
