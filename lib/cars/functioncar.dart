import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';

List<ProductCarItem> getProductByCategoryCar(
    String typebrandCar, List<ProductCarItem> allproductscar) {
  List<ProductCarItem> productscar = [];
  try {
    for (var productcar in allproductscar) {
      if (productcar.brand == typebrandCar) {
        productscar.add(productcar);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  print('$productscar');
  return productscar;
}
