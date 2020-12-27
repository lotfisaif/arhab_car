import 'package:flutter/cupertino.dart';

class SelectedCar extends ChangeNotifier {
  bool setHonda0 = false,
      setMercedes1 = false,
      setAudi2 = false,
      setBMW3 = false,
      setToyota4 = false,
      setTesla5 = false,
      setNissan6 = false,
      setFord7 = false,
      setKIA8 = false,
      setFerrari9 = false,
      setGreatWall10 = false,
      setBentley11 = false,
      setOpel12 = false,
      setFoton13 = false,
      setSsangYong14 = false,
      setRenault15 = false,
      setJaguar16 = false,
      setAstonMartin17 = false,
      setSkoda18 = false,
      setPROTON19 = false,
      setSuzuki20 = false;
  changeisSelectingcar(bool value0, bool value1, bool value2) {
    setHonda0 = value0;
    setMercedes1 = value1;
    setAudi2 = value2;
    // setBMW3 = value;
    // setToyota4 = value;
    // setTesla5 = value;
    // setNissan6 = value;
    // setFord7 = value;
    // setKIA8 = value;
    // setFerrari9 = value;
    // setGreatWall10 = value;
    // setBentley11 = value;
    // setOpel12 = value;
    // setFoton13 = value;
    // setSsangYong14 = value;
    // setRenault15 = value;
    // setJaguar16 = value;
    // setAstonMartin17 = value;
    // setSkoda18 = value;
    // setPROTON19 = value;
    // setSuzuki20 = value;
    notifyListeners();
  }
}
