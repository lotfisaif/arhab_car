import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class NavigationItem {
  IconData iconData;

  NavigationItem(this.iconData);
}

List<NavigationItem> getNavigationItemList() {
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

class Car {
  final String pId;
  final String title;
  final String price;
  final String color;
  final String gearbox;
  final String fuelLiter;
  final String brand;
  final String cardoor;
  final String travellingBagSmal;
  final String travellingBagLarge;
  final String adaptor;
  final String jeer;
  final String typeFuel;
  final String evaluation;
  final String speedKilo;
  final List<dynamic> imageUrlsCar;
  final String numCar;
  int cQuantitycar;
  Car({
    this.numCar,
    this.cQuantitycar,
    this.pId,
    this.title,
    this.price,
    this.color,
    this.gearbox,
    this.fuelLiter,
    this.brand,
    this.cardoor,
    this.travellingBagSmal,
    this.travellingBagLarge,
    this.adaptor,
    this.jeer,
    this.typeFuel,
    this.evaluation,
    this.speedKilo,
    this.imageUrlsCar,
  });
}

List<Car> getCarList() {
  final _store = StoreCar();
  List<Car> productscar = [];

  _store.loadProductCar().forEach((QuerySnapshot snapshot) {
    if (snapshot != null) {
      for (var doc in snapshot.documents) {
        var data = doc.data;
        productscar.add(Car(
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
    }
  });
  print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
  return productscar;
}

getloadfirbase() {
  List<Car> productscar = [];
  final _store = StoreCar();

  StreamBuilder<QuerySnapshot>(
    stream: _store
        .loadProductCar(), //  return _firestore.collection(kcollictionCars).snapshots();

    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.hasData) {
        for (var doc in snapshot.data.documents) {
          var data = doc.data;
          productscar.add(Car(
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
      } else {
        return Center(
          child: Text('Loading...'),
        );
      }
      return Text('data');
    },
  );
  return productscar;
}

// <Car>[
//   Car(
//     "Land Rover",
//     "Discovery",
//     2580,
//     "Weekly",
//     [
//       "assets/images/land_rover_0.png",
//       "assets/images/land_rover_1.png",
//       "assets/images/land_rover_2.png",
//     ],
//   ),
//   Car(
//     "Alfa Romeo",
//     "C4",
//     3580,
//     "Monthly",
//     [
//       "assets/images/alfa_romeo_c4_0.png",
//     ],
//   ),
//   Car(
//     "Nissan",
//     "GTR",
//     1100,
//     "Daily",
//     [
//       "assets/images/nissan_gtr_0.png",
//       "assets/images/nissan_gtr_1.png",
//       "assets/images/nissan_gtr_2.png",
//       "assets/images/nissan_gtr_3.png",
//     ],
//   ),
//   Car(
//     "Acura",
//     "MDX 2020",
//     2200,
//     "Monthly",
//     [
//       "assets/images/acura_0.png",
//       "assets/images/acura_1.png",
//       "assets/images/acura_2.png",
//     ],
//   ),
//   Car(
//     "Chevrolet",
//     "Camaro",
//     3400,
//     "Weekly",
//     [
//       "assets/images/camaro_0.png",
//       "assets/images/camaro_1.png",
//       "assets/images/camaro_2.png",
//     ],
//   ),
//   Car(
//     "Ferrari",
//     "Spider 488",
//     4200,
//     "Weekly",
//     [
//       "assets/images/ferrari_spider_488_0.png",
//       "assets/images/ferrari_spider_488_1.png",
//       "assets/images/ferrari_spider_488_2.png",
//       "assets/images/ferrari_spider_488_3.png",
//       "assets/images/ferrari_spider_488_4.png",
//     ],
//   ),
//   Car(
//     "Ford",
//     "Focus",
//     2300,
//     "Weekly",
//     [
//       "assets/images/ford_0.png",
//       "assets/images/ford_1.png",
//     ],
//   ),
//   Car(
//     "Fiat",
//     "500x",
//     1450,
//     "Weekly",
//     [
//       "assets/images/fiat_0.png",
//       "assets/images/fiat_1.png",
//     ],
//   ),
//   Car(
//     "Honda",
//     "Civic",
//     900,
//     "Daily",
//     [
//       "assets/images/honda_0.png",
//     ],
//   ),
//   Car(
//     "Citroen",
//     "Picasso",
//     1200,
//     "Monthly",
//     [
//       "assets/images/citroen_0.png",
//       "assets/images/citroen_1.png",
//       "assets/images/citroen_2.png",
//     ],
//   ),
// ];

class Dealer {
  String name;
  int offers;
  String image;

  Dealer(this.name, this.offers, this.image);
}

List<Dealer> getDealerList() {
  return <Dealer>[
    Dealer(
      "Hertz",
      174,
      "images/cars/hertz.png",
    ),
    Dealer(
      "Avis",
      126,
      "images/cars/avis.png",
    ),
    Dealer(
      "Tesla",
      89,
      "images/cars/tesla.jpg",
    ),
  ];
}

class Filter {
  String name;

  Filter(this.name);
}

List<Filter> getFilterList() {
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}
