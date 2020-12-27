import 'package:flutter/cupertino.dart';

class ModalHud extends ChangeNotifier {
  bool isloading = false;
  changeisloading(bool value) {
    isloading = value;
    notifyListeners();
  }
}
