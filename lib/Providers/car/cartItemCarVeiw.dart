import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/model/product.dart';
import 'package:flutter/cupertino.dart';

class CartItemCarView extends ChangeNotifier {
  List<Car> productscar = [];

  addProductCarView(Car product) {
    productscar.add(product);
    notifyListeners();
  }

  deleteProductCarView(Product product) {
    productscar.remove(product);
    notifyListeners();
  }
}
