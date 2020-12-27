import 'package:arhb_car_rental/cars/CarScreenUi/showroom.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePageCar extends StatefulWidget {
  static String id = "HomePageCar";

  @override
  _HomePageCarState createState() => _HomePageCarState();
}

class _HomePageCarState extends State<HomePageCar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.muliTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Showroom(),
    );
  }
}

class SplashMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashHScreen();
  }
}

class AnimatedSplashHScreen extends StatefulWidget {
  static String id = "AnimatedSplashHScreen";
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashHScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() {
    var _duration = new Duration(seconds: 9);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(HomePageCar.id);
  }

  Future splashfuture() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void initState() {
    splashfuture();
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 9));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'images/splash/acura_0.png',
                width: animation.value * 300,
                height: animation.value * 300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class HomePageCar extends StatefulWidget {
//   static String id = 'HomePageCar';

//   @override
//   _HomePageCarState createState() => _HomePageCarState();
// }

// class _HomePageCarState extends State<HomePageCar> {
//   final _auth = Auth();
//   FirebaseUser _loggedUser;

//   int _tabBarIndex = 0;
//   int _bottomBarIndex = 0;
//   final _store = StoreCar();
//   List<ProductCarItem> _productscar;
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         DefaultTabController(
//           length: 4,
//           child: Scaffold(
//             bottomNavigationBar: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               unselectedItemColor: kUnActiveColorcar,
//               currentIndex: _bottomBarIndex,
//               fixedColor: kmainColorcar,
//               onTap: (value) async {
//                 if (value == 3) {
//                   SharedPreferences pref =
//                       await SharedPreferences.getInstance();
//                   pref.clear();
//                   _auth.signOut();
//                   Navigator.of(context).pushReplacementNamed(Login.id);
//                 }
//                 setState(() {
//                   _bottomBarIndex = value;
//                 });
//               },
//               items: [
//                 BottomNavigationBarItem(
//                     title: Text(
//                       'Test',
//                     ),
//                     icon: Icon(Icons.person)),
//                 BottomNavigationBarItem(
//                     title: Text('Test'), icon: Icon(Icons.person)),
//                 BottomNavigationBarItem(
//                     title: Text('Test'), icon: Icon(Icons.person)),
//                 BottomNavigationBarItem(
//                     title: Text('Sign Out'), icon: Icon(Icons.close)),
//               ],
//             ),
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               elevation: 0,
//               bottom: TabBar(
//                 indicatorColor: kmainColorcar,
//                 onTap: (value) {
//                   setState(() {
//                     _tabBarIndex = value;
//                   });
//                 },
//                 tabs: <Widget>[
//                   Text(
//                     'Honda',
//                     style: TextStyle(
//                       color:
//                           _tabBarIndex == 0 ? Colors.black : kUnActiveColorcar,
//                       fontSize: _tabBarIndex == 0 ? 16 : null,
//                     ),
//                   ),
//                   Text(
//                     'Mercedes',
//                     style: TextStyle(
//                       color:
//                           _tabBarIndex == 1 ? Colors.black : kUnActiveColorcar,
//                       fontSize: _tabBarIndex == 1 ? 16 : null,
//                     ),
//                   ),
//                   Text(
//                     'Audi',
//                     style: TextStyle(
//                       color:
//                           _tabBarIndex == 2 ? Colors.black : kUnActiveColorcar,
//                       fontSize: _tabBarIndex == 2 ? 16 : null,
//                     ),
//                   ),
//                   Text(
//                     'BMW',
//                     style: TextStyle(
//                       color:
//                           _tabBarIndex == 3 ? Colors.black : kUnActiveColorcar,
//                       fontSize: _tabBarIndex == 3 ? 16 : null,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             body: TabBarView(
//               children: <Widget>[
//                 HondaViewcar(),
//                 ProductsViewcar(kMercedes, _productscar),
//                 ProductsViewcar(kAudi, _productscar),
//                 ProductsViewcar(kBMW, _productscar),
//               ],
//             ),
//           ),
//         ),
//         Material(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
//             child: Container(
//               height: MediaQuery.of(context).size.height * .1,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text(
//                     'Discover'.toUpperCase(),
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, CartScreenCar.id);
//                       },
//                       child: Icon(Icons.shopping_cart))
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }

//   @override
//   void initState() {
//     getCurrenUser();
//   }

//   getCurrenUser() async {
//     _loggedUser = await _auth.getUser();
//   }

//   Widget HondaViewcar() {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _store.loadProductCar(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<ProductCarItem> productscar = [];
//           for (var doc in snapshot.data.documents) {
//             var data = doc.data;
//             productscar.add(ProductCarItem(
//               pId: doc.documentID,
//               title: data[ktitle],
//               price: data[kprice],
//               brand: data[kbrand],
//               color: data[kcolor],
//               adaptor: data[kadaptor],
//               cardoor: data[kcardoor],
//               evaluation: data[kevaluation],
//               fuelLiter: data[kfuelLiter],
//               gearbox: data[kgearbox],
//               jeer: data[kjeer],
//               speedKilo: data[kspeedKilo],
//               travellingBagLarge: data[ktravellingBagLarge],
//               travellingBagSmal: data[ktravellingBagSmal],
//               typeFuel: data[ktypeFuel],
//             ));
//           }
//           _productscar = [...productscar];

//           productscar.clear();
//           productscar = getProductByCategoryCar(kHonda, _productscar);
//           return GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: .8,
//             ),
//             itemBuilder: (context, index) => Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, ProductInfoCar.id,
//                       arguments: productscar[index]);
//                 },
//                 child: Stack(
//                   children: <Widget>[
//                     // Positioned.fill(
//                     //   child: Image(
//                     //     fit: BoxFit.fill,
//                     //     image: AssetImage(productscar[index].path),
//                     //   ),
//                     // ),
//                     Positioned(
//                       bottom: 0,
//                       child: Opacity(
//                         opacity: .6,
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 60,
//                           color: Colors.white,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 10, vertical: 5),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   productscar[index].title,
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                                 Text('\$ ${productscar[index].price}')
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             itemCount: productscar.length,
//           );
//         } else {
//           return Center(child: Text('Loading...'));
//         }
//       },
//     );
//   }
// }
