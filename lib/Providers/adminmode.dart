import 'package:flutter/cupertino.dart';

class Admin extends ChangeNotifier {
  bool isAdmin = false;
  changeadmin(bool value) {
    isAdmin = value;

    notifyListeners();
  }
}
