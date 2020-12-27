import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/realtime.dart';
import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/splash/FadeAnimation.dart';
import 'package:flutter/material.dart';

class MyAppMap extends StatefulWidget {
  final Car car;
  final String price;

  MyAppMap({@required this.car, @required this.price});
  @override
  _MyAppMapState createState() => _MyAppMapState();
}

class _MyAppMapState extends State<MyAppMap> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            resizeToAvoidBottomPadding: true,
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              FadeAnimation(
                                  2,
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color.fromRGBO(
                                                  143, 148, 251, .2),
                                              blurRadius: 20.0,
                                              offset: Offset(0, 10))
                                        ]),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: 300,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'images/splash/undraw_town_r6pc.png'),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Text(
                                          "الرجاء قم بتحديد أقرب موقعك من فرع",
                                          style: TextStyle(
                                            backgroundColor: Colors.grey[300],
                                            fontSize: 20,
                                            fontFamily: 'Pacifico',
                                            color: kPrimaryColor,
                                          ),
                                          // textAlign: TextAlign.left,
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ],
                                    ),
                                  )),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              FadeAnimation(
                                3,
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        Color.fromRGBO(143, 148, 251, 1),
                                        Color.fromRGBO(143, 148, 251, .6),
                                      ])),
                                  child: Center(
                                    child: Builder(
                                      builder: (context) => FlatButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    RealtimeMapScrren(
                                                  car: widget.car,
                                                  price: widget.price,
                                                ),
                                              ));
                                        },
                                        child: Text(
                                          'Next',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              letterSpacing: 3),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   void initState() {
//     super.initState();

//     //storeUserLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text('Location Pratice'),
//     //   ),
//     //   body: Center(
//     //     child: FlatButton(
//     //       onPressed: () {
//     //         Navigator.push(context,
//     //             MaterialPageRoute(builder: (context) => RealtimeMapScrren()));
//     //       },
//     //       child: Text('Realtime Tracking Map'),
//     //       color: Colors.black,
//     //       textColor: Colors.white,
//     //     ),
//     //   ),
//     // );
//   }

//   // storeUserLocation() {
//   //   Location location = new Location();

//   //   location.onLocationChanged().listen((LocationData currentLocation) {
//   //     Firestore.instance
//   //         .collection('mapsUser')
//   //         .document('zfakfn97GhNkZ3zI5IE4')
//   //         .setData({
//   //       'name': 'Eyad',
//   //       'location':
//   //           GeoPoint(currentLocation.latitude, currentLocation.longitude)
//   //     });
//   //   });
//   // }
// }
