import 'package:arhb_car_rental/Screens/admin/orderScreen.dart';
import 'package:arhb_car_rental/Screens/loginScreen.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/available_cars.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/book_car.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/car_widget.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/dealer_widget.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/search.dart';
import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';
import 'package:arhb_car_rental/model/cars/userinformtion.dart';
import 'package:arhb_car_rental/services/auth.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Showroom extends StatefulWidget {
  static String id = 'Showroom';
  @override
  _ShowroomState createState() => _ShowroomState();
}

class _ShowroomState extends State<Showroom> {
  String urlUser;
  final _auth = Auth();
  FirebaseUser _loggedUser;
  var queryResultSet = [];
  var tempSearchStore = [];
  int _bottomBarIndex = 0;
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
          .collection('clients')
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
        if (element['businessName'].startsWith(capitalizedValue)) {
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
  List<UserInformation> users = [];
  String _emali;
  List<Dealer> dealers = getDealerList();
  getcurrentUser() async {
    FirebaseUser firebaseUser = await _auth.getUser();
    setState(() {
      _emali = firebaseUser.email;
    });
  }

  @override
  void initState() {
    getcurrentUser();
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.black, size: 28),
            backgroundColor: Colors.transparent,
            elevation: 0,
            brightness: Brightness.light,
            title: Text(
              "Car Rental App",
              style: GoogleFonts.muli(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          drawer: Drawer(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: StreamBuilder<QuerySnapshot>(
                stream: _store.loadUser(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    for (var doc in snapshot.data.documents) {
                      var data = doc.data;
                      if (_emali == data[kemailUser]) {
                        users.add(
                          UserInformation(
                            emailUser: data[kemailUser],
                            passwordUser: data[kpasswordUser],
                            imageUrlUser: data[kimageUrlUser],
                            nameUser: data[knameUser],
                            pId: doc.documentID,
                          ),
                        );
                      }
                    }

                    return Container(
                      color: Colors.white,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, right: 30, left: 30),
                            child: UserAccountsDrawerHeader(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              arrowColor: Colors.white,
                              accountName: new Text(
                                "${users[0].nameUser}",
                                style: TextStyle(
                                    fontFamily: 'Pacifico',
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              accountEmail: new Text(
                                "${users[0].emailUser}",
                                style: TextStyle(
                                    fontFamily: 'Pacifico',
                                    color: Colors.grey,
                                    fontSize: 20,
                                    letterSpacing: 2.5),
                              ),
                              currentAccountPicture: CircleAvatar(
                                radius: 55,
                                backgroundColor: Color(0xffFDCF09),
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      NetworkImage(users[0].imageUrlUser[0]),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 0,
                            indent: 10.5,
                          ),
                          ListTile(
                            title: Text(
                              ' فيديوهات تعليمية',
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                color: Colors.grey[800],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.video_label,
                              color: Colors.grey[800],
                              size: 25,
                            ),
                            onTap: () async {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text(
                              ' أبلغني',
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                color: Colors.grey[800],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.notifications_active,
                              color: Colors.grey[800],
                              size: 25,
                            ),
                            onTap: () async {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text(
                              '  تواصل',
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                color: Colors.grey[800],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.crop_rotate,
                              color: Colors.grey[800],
                              size: 25,
                            ),
                            onTap: () async {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text(
                              '  عنا',
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                color: Colors.grey[800],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.announcement,
                              color: Colors.grey[800],
                              size: 25,
                            ),
                            onTap: () async {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text(
                              '  مشاركة',
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                color: Colors.grey[800],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.share,
                              color: Colors.grey[800],
                              size: 25,
                            ),
                            onTap: () async {
                              // share(context);
                              // Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderScreen()),
                              );
                            },
                          ),
                          ListTile(
                            title: Text(
                              'تسجيل الخروج',
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                color: Colors.grey[800],
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Icon(
                              Icons.not_interested,
                              color: Colors.grey[800],
                              size: 25,
                            ),
                            onTap: () async {
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              pref.clear();
                              _auth.signOut();
                              // Navigator.of(context)
                              //     .pushReplacementNamed(Login.id);
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (BuildContext context) =>
                              //             Login()));
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => Login()),
                                ModalRoute.withName('/'),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: Text('Loading...'),
                    );
                  }
                },
              ),
            ),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadProductCar(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;
                  cars.add(Car(
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

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100]),
                          child: Center(
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SearchView()),
                                );
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Search',
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.search,
                                    color: Colors.grey[400],
                                    size: 24,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "TOP DEALS",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AvailableCars()),
                                            );
                                          },
                                          child: Text(
                                            "view all",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 12,
                                          color: kPrimaryColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 280,
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: buildDeals(cars),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AvailableCars()),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: 16, right: 16, left: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(24),
                                    height: 100,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Available Cars",
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "Long term and short term",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          height: 50,
                                          width: 50,
                                          child: Center(
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "TOP DEALERS",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "view all",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 12,
                                          color: kPrimaryColor,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 150,
                                margin: EdgeInsets.only(bottom: 16),
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: buildDealers(),
                                ),
                              ),
                            ],
                          ),
                        ),
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

          // bottomNavigationBar: BottomNavigationBar(
          //   type: BottomNavigationBarType.fixed,
          //   unselectedItemColor: kUnActiveColor,
          //   currentIndex: _bottomBarIndex,
          //   fixedColor: kmainColor,
          //   onTap: (value) async {
          //     if (value == 3) {
          //       SharedPreferences pref = await SharedPreferences.getInstance();
          //       pref.clear();
          //       _auth.signOut();
          //       Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //               builder: (BuildContext context) => Login()));
          //     }
          //     setState(() {
          //       _bottomBarIndex = value;
          //     });
          //   },
          //   items: [
          //     BottomNavigationBarItem(
          //         title: Text(
          //           'Test',
          //         ),
          //         icon: Icon(Icons.person)),
          //     BottomNavigationBarItem(
          //         title: Text('Test'), icon: Icon(Icons.person)),
          //     BottomNavigationBarItem(
          //         title: Text('Test'), icon: Icon(Icons.person)),
          //     BottomNavigationBarItem(
          //         title: Text('Sign Out'), icon: Icon(Icons.close)),
          //   ],
          // ),

          // Container(
          //   height: 70,
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(30),
          //         topRight: Radius.circular(30),
          //       )),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: buildNavigationItems(),
          //   ),
          // ),
        ),
      ),
    );
  }

  List<Widget> buildDeals(List<Car> cars) {
    List<Widget> list = [];

    for (int i = 0; i < cars.length; i++) {
      if (i == 3) {
        break;
      }
      list.add(GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookCar(car: cars[i]),
                ));
          },
          child: buildCar(cars[i], i)));
    }
    return list;
  }

  List<Widget> buildDealers() {
    List<Widget> list = [];
    for (var i = 0; i < dealers.length; i++) {
      list.add(buildDealer(dealers[i], i));
    }
    return list;
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var navigationItem in navigationItems) {
      list.add(buildNavigationItem(navigationItem));
      print('$navigationItem');
      print('ffffffffffffffffffffffffffffff');
      if (navigationItem == NavigationItem(Icons.calendar_today)) {
        print('$navigationItem');
        print('ffffffffffffffffffffffffffffff');
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // pref.clear();
        // _auth.signOut();
        // Navigator.of(context).pushReplacementNamed(Login.id);
      }
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () async {
        print('$item');
        print('jjjjjjjjjjjjjjjjjjjjjjjjjjjj');
        if (item == NavigationItem(Icons.calendar_today)) {
          print('$item');
          print('ffffffffffffffffffffffffffffff');
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.clear();
          _auth.signOut();
          Navigator.pop(context);
        }
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Stack(
          children: <Widget>[
            selectedItem == item
                ? Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColorShadow,
                      ),
                    ),
                  )
                : Container(),
            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 24,
              ),
            )
          ],
        ),
      ),
    );
  }

  // void share(BuildContext context) {
  //   final RenderBox box = context.findRenderObject();
  //   final String text = "hello";
  //   Share.share(
  //     text,
  //     subject: text,
  //     sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
  //   );
  // }
}
