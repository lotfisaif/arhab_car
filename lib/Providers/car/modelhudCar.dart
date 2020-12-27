import 'package:flutter/cupertino.dart';

class ModalHudCar extends ChangeNotifier {
  bool isloadingcar = false;
  changeisloadingcar(bool value) {
    isloadingcar = value;
    notifyListeners();
  }
}
