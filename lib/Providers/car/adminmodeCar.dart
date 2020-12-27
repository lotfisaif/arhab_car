import 'package:flutter/cupertino.dart';

class AdminCar extends ChangeNotifier {
  bool isAdmincar = false;
  changeadminCar(bool value) {
    isAdmincar = value;

    notifyListeners();
  }
}
