import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';
import 'package:flutter/cupertino.dart';

class CartItemCar extends ChangeNotifier {
  List<Car> productscar = [];

  addProductcar(Car productcar) {
    productscar.add(productcar);
    notifyListeners();
  }

  deleteProductcar(Car productcar) {
    productscar.remove(productcar);
    notifyListeners();
  }
}
