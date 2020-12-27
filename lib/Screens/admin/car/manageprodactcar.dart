import 'package:arhb_car_rental/Screens/admin/car/editProductscar.dart';
import 'package:arhb_car_rental/Screens/admin/car/widgetapp.dart';
import 'package:arhb_car_rental/Widgets/car/custom_menucar.dart';
import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/cars/functioncar.dart';
import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:arhb_car_rental/splash/FadeAnimation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ManageProductCar extends StatefulWidget {
  static String id = "ManageProductCar";

  @override
  _ManageProductCarState createState() => _ManageProductCarState();
}

class _ManageProductCarState extends State<ManageProductCar> {
  List<ProductCarItem> _productscar;
  final _store = StoreCar();

  bool setHonda0 = true,
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

  int selectBrandCar = 0,
      setHonda = 0,
      setMercedes = 1,
      setAudi = 2,
      setBMW = 3,
      setToyota = 4,
      setTesla = 5,
      setNissan = 6,
      setFord = 7,
      setKIA = 8,
      setFerrari = 9,
      setGreatWall = 10,
      setBentley = 11,
      setOpel = 12,
      setFoton = 13,
      setSsangYong = 14,
      setRenault = 15,
      setJaguar = 16,
      setAstonMartin = 17,
      setSkoda = 18,
      setPROTON = 19,
      setSuzuki = 20;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectBrandCar = 0;
      setHonda0 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FadeAnimation(
          2.0,
          Container(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Edit Cars',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              child: WidgettApp("Honda", setHonda0),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setHonda;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = true;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Mercedes", setMercedes1),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setMercedes;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = true;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Audi", setAudi2),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setAudi;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = true;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("BMW", setBMW3),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setBMW;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = true;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Toyota", setToyota4),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setToyota;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = true;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Tesla", setTesla5),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setTesla;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = true;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Nissan", setNissan6),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setNissan;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = true;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Ford", setFord7),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setFord;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = true;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("KIA", setKIA8),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setKIA;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = true;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Ferrari", setFerrari9),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setFerrari;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = true;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Great Wall", setGreatWall10),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setGreatWall;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = true;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Bentley ", setBentley11),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setBentley;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = true;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Opel ", setOpel12),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setOpel;
                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = true;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Foton ", setFoton13),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setFoton;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = true;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("SsangYong ", setSsangYong14),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setSsangYong;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = true;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Renault ", setRenault15),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setRenault;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = true;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Jaguar ", setJaguar16),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setJaguar;
                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = true;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child:
                                  WidgettApp("AstonMartin ", setAstonMartin17),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setAstonMartin;
                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = true;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Skoda ", setSkoda18),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setSkoda;

                                  setSuzuki20 = false;
                                  setPROTON19 = false;
                                  setSkoda18 = true;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("PROTON ", setPROTON19),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setPROTON;
                                  setSuzuki20 = false;
                                  setPROTON19 = true;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                            InkWell(
                              child: WidgettApp("Suzuki ", setSuzuki20),
                              onTap: () {
                                setState(() {
                                  selectBrandCar = setSuzuki;
                                  setSuzuki20 = true;
                                  setPROTON19 = false;
                                  setSkoda18 = false;
                                  setAstonMartin17 = false;
                                  setJaguar16 = false;
                                  setHonda0 = false;
                                  setMercedes1 = false;
                                  setAudi2 = false;
                                  setBMW3 = false;
                                  setToyota4 = false;
                                  setTesla5 = false;
                                  setNissan6 = false;
                                  setFord7 = false;
                                  setKIA8 = false;
                                  setFerrari9 = false;
                                  setGreatWall10 = false;
                                  setBentley11 = false;
                                  setOpel12 = false;
                                  setFoton13 = false;
                                  setSsangYong14 = false;
                                  setRenault15 = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                selselected(selectBrandCar),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget HondaViewcar(String typebrandCar) {
    return StreamBuilder<QuerySnapshot>(
      stream: _store.loadProductCar(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<ProductCarItem> productscar = [];
          for (var doc in snapshot.data.documents) {
            var data = doc.data;
            productscar.add(ProductCarItem(
              pId: doc.documentID,
              title: data[ktitle],
              price: data[kprice],
              brand: data[kbrand],
              color: data[kcolor],
              adaptor: data[kadaptor],
              cardoor: data[kcardoor],
              evaluation: data[kevaluation],
              fuelLiter: data[kfuelLiter],
              gearbox: data[kgearbox],
              jeer: data[kjeer],
              speedKilo: data[kspeedKilo],
              travellingBagLarge: data[ktravellingBagLarge],
              travellingBagSmal: data[ktravellingBagSmal],
              typeFuel: data[ktypeFuel],
              numCar: data[knumCar],
              imageUrlsCar: data[kimageUrlcar],
            ));
          }
          _productscar = [...productscar];

          productscar.clear();
          productscar = getProductByCategoryCar(typebrandCar, _productscar);

          return Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              margin: EdgeInsets.all(10),
              height: 460,
              width: 300,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                ),
                itemCount: productscar.length,
                itemBuilder: (context, indext) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTapUp: (details) async {
                      double dx = details.globalPosition.dx;
                      double dy = details.globalPosition.dy;
                      double dxWidth = MediaQuery.of(context).size.width - dx;
                      double dyHight = MediaQuery.of(context).size.height - dy;
                      await showMenu(
                          context: context,
                          position:
                              RelativeRect.fromLTRB(dx, dy, dxWidth, dyHight),
                          items: [
                            MyPopupMenuItem(
                              child: Text('Edit'),
                              onClick: () {
                                Navigator.pushNamed(context, EditProductCar.id,
                                    arguments: productscar[indext]);
                              },
                            ),
                            MyPopupMenuItem(
                              child: Text('Delete'),
                              onClick: () {
                                _store
                                    .deleteProductcar(productscar[indext].pId);

                                Navigator.pop(context);
                              },
                            ),
                          ]);
                    },
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  productscar[indext].imageUrlsCar[0]),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Opacity(
                            opacity: .8,
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      productscar[indext].title,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$${productscar[indext].price}')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Text('Loading...'),
          );
        }
      },
    );
  }

  selselected(int selectBrandCar) {
    switch (selectBrandCar) {
      case 0:
        return HondaViewcar(kHonda);
        break;
      case 1:
        return HondaViewcar(kMercedes);
        break;
      case 2:
        return HondaViewcar(kAudi);
        break;
      case 3:
        return HondaViewcar(kBMW);
        break;
      case 4:
        return HondaViewcar(kToyota);
        break;
      case 5:
        return HondaViewcar(kTesla);
        break;
      case 6:
        return HondaViewcar(kNissan);
        break;
      case 7:
        return HondaViewcar(kFord);
        break;
      case 8:
        return HondaViewcar(kKia);
        break;
      case 9:
        return HondaViewcar(kFerrari);
        break;
      case 10:
        return HondaViewcar(kGreatWall);
        break;
      case 11:
        return HondaViewcar(kBentley);
        break;
      case 12:
        return HondaViewcar(kOpel);
        break;
      case 13:
        return HondaViewcar(kFoton);
        break;
      case 14:
        return HondaViewcar(kSsangYong);
        break;
      case 15:
        return HondaViewcar(kRenault);
        break;
      case 16:
        return HondaViewcar(kJaguar);
        break;
      case 17:
        return HondaViewcar(kAstonMartin);
        break;
      case 18:
        return HondaViewcar(kSkoda);
        break;
      case 19:
        return HondaViewcar(kPROTON);
        break;
      case 20:
        return HondaViewcar(kSuzuki);
        break;
      default:
    }
  }
}
