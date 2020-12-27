import 'package:flutter/cupertino.dart';

class Order {
  String documentId;
  int totalprice;
  String adress;
  Order(
      {@required this.adress,
      @required this.totalprice,
      @required this.documentId});
}
