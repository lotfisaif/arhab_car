import 'package:arhb_car_rental/cars/CarScreenUi/book_car.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/car_widget.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AvailableCars extends StatefulWidget {
  @override
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {
  final _store = StoreCar();
  List<Filter> filters = <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
  Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: buildContainer(),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            buildFilterIcon(),
            Row(
              children: buildFilters(),
            ),
          ],
        ),
      ),
    );
  }

  buildContainer() {
    if (selectedFilter == filters[0]) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
          stream: _store.loadProductCar(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Car> productscar = [];
              for (var doc in snapshot.data.documents) {
                var data = doc.data;
                int a = int.parse(data[kprice]);
                if (data[kevaluation] == "ممتاز") {
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
                } else {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Center(
                        child: Text(
                      'No Data',
                      style: TextStyle(fontSize: 25, letterSpacing: 5),
                    )),
                  );
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: Colors.grey[300],
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 28,
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Available Cars (" + productscar.length.toString() + ")",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      childAspectRatio: 1 / 1.55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: productscar.map((item) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookCar(car: item)),
                              );
                            },
                            child: buildCar(item, null));
                      }).toList(),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('Loading...'),
              );
            }
          },
        ),
      );
    } else if (selectedFilter == filters[1]) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
          stream: _store.loadProductCar(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Car> productscar = [];
              for (var doc in snapshot.data.documents) {
                var data = doc.data;
                int a = int.parse(data[kprice]);
                if (a > 5) {
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
                } else {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Center(
                        child: Text(
                      'No Data',
                      style: TextStyle(fontSize: 25, letterSpacing: 5),
                    )),
                  );
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: Colors.grey[300],
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 28,
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Available Cars (" + productscar.length.toString() + ")",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      childAspectRatio: 1 / 1.55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: productscar.map((item) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookCar(car: item)),
                              );
                            },
                            child: buildCar(item, null));
                      }).toList(),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('Loading...'),
              );
            }
          },
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
          stream: _store.loadProductCar(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Car> productscar = [];
              for (var doc in snapshot.data.documents) {
                var data = doc.data;
                int b = int.parse(data[kprice]);
                if (b <= 5) {
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
                } else {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    child: Center(
                        child: Text(
                      'No Data',
                      style: TextStyle(fontSize: 25, letterSpacing: 5),
                    )),
                  );
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          border: Border.all(
                            color: Colors.grey[300],
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 28,
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Available Cars (" + productscar.length.toString() + ")",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      childAspectRatio: 1 / 1.55,
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: productscar.map((item) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookCar(car: item)),
                              );
                            },
                            child: buildCar(item, null));
                      }).toList(),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('Loading...'),
              );
            }
          },
        ),
      );
    }
  }

  Widget buildFilterIcon() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }

  List<Widget> buildFilters() {
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilter(filters[i]));
      print('${filters[i]}');
    }
    return list;
  }

  Widget buildFilter(Filter filter) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
          print('$selectedFilter');
        });
      },
      child: Padding(
        padding: EdgeInsets.only(right: 16),
        child: Text(
          filter.name,
          style: TextStyle(
            color: selectedFilter == filter ? kPrimaryColor : Colors.grey[300],
            fontSize: 16,
            fontWeight:
                selectedFilter == filter ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
