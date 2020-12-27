import 'package:arhb_car_rental/cars/CarScreenUi/book_car.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/booksearch.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/car_widget.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/dealer_widget.dart';
import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var queryResultSet = [];
  var tempSearchStore = [];

  initiateSearch(value) {
    if (value.length == 0) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
    }

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);

    if (queryResultSet.length == 0 && value.length == 1) {
      Firestore.instance
          .collection(kcollictionCars)
          .where('searchKey', isEqualTo: value.substring(0, 1).toUpperCase())
          .getDocuments()
          .then((QuerySnapshot docs) {
        for (int i = 0; i < docs.documents.length; ++i) {
          queryResultSet.add(docs.documents[i].data);
        }
      });
    } else {
      tempSearchStore = [];
      queryResultSet.forEach((element) {
        if (element[kbrand].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      });
    }
  }

  final _store = StoreCar();
  List<ProductCarItem> _productscar;
  List<NavigationItem> navigationItems = getNavigationItemList();
  NavigationItem selectedItem;

  List<Car> cars = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
          appBar: new AppBar(
            elevation: 0,
            title: Text(
              ' search By Model car',
              style: TextStyle(color: Colors.grey, letterSpacing: 4),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: ListView(children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  onChanged: (val) {
                    initiateSearch(val);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: EdgeInsets.only(
                      left: 30,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 24.0, left: 16.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            GridView.count(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                physics: BouncingScrollPhysics(),
                childAspectRatio: 1 / 1.55,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                primary: false,
                shrinkWrap: true,
                children: tempSearchStore.map((element) {
                  return buildResultCard(element);
                }).toList())
          ])),
    );
  }

  Widget buildResultCard(data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookCarSearch(
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
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.all(16),
        //margin: EdgeInsets.only(right: 16, left: 16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    data[ktitle],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 120,
              color: Colors.white,
              child: Center(
                child: Image.network(
                  data[kimageUrlcar][0],
                  // car.images[0],
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              data[ktitle],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              data[kbrand],
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            Text(
              "per Daily \$ ${data[kprice]}",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
