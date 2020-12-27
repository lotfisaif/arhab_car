import 'package:flutter/cupertino.dart';

class OrderCar {
  String documentIdcar;
  String totalpricecar;
  String adresscar;
  String numphone;
  String name;
  OrderCar(
      {@required this.adresscar,
      @required this.totalpricecar,
      @required this.documentIdcar,
      @required this.numphone});
}
