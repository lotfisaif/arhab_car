import 'package:arhb_car_rental/Screens/admin/car/addProductcar.dart';
import 'package:arhb_car_rental/Screens/admin/car/manageprodactcar.dart';
import 'package:arhb_car_rental/Screens/admin/car/orderScreencar.dart';
import 'package:flutter/material.dart';

import 'package:arhb_car_rental/splash/delayed_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminHomeCar extends StatefulWidget {
  static String id = "AdminHomeCar";
  @override
  _AdminHomeCarState createState() => _AdminHomeCarState();
}

class _AdminHomeCarState extends State<AdminHomeCar>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // AvatarGlow(
                //     endRadius: 90,
                //     duration: Duration(seconds: 2),
                //     glowColor: Colors.white24,
                //     repeat: true,
                //     repeatPauseDuration: Duration(seconds: 2),
                //     startDelay: Duration(seconds: 1),
                //     child: Container(
                //       decoration: BoxDecoration(
                //           image: DecorationImage(
                //               image: AssetImage(
                //                   'images/splash/undraw_Login_re_4vu2.png'))),
                //     )),
                DelayedAnimation(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'images/splash/undraw_dashboard_nklg.png'))),
                  ),
                  delay: delayedAmount + 1000,
                ),
                // DelayedAnimation(
                //   child: Text(
                //     "  تطبيق  أرحب",
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 35.0,
                //         color: color),
                //   ),
                //   delay: delayedAmount + 2000,
                // ),
                // SizedBox(
                //   height: 30.0,
                // ),
                // DelayedAnimation(
                //   child: Text(
                //     "يرحب بكم جميعا  ",
                //     style: TextStyle(fontSize: 20.0, color: color),
                //   ),
                //   delay: delayedAmount + 3000,
                // ),
                // DelayedAnimation(
                //   child: Text(
                //     "أهلا وسهلا ",
                //     style: TextStyle(fontSize: 20.0, color: color),
                //   ),
                //   delay: delayedAmount + 3000,
                // ),
                // SizedBox(
                //   height: 100.0,
                // ),
                DelayedAnimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AddProductar.id);
                          },
                          child: Container(
                            height: 60,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.grey[100],
                            ),
                            child: Center(
                              child: Text(
                                'اضافة سيارة ',
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8185E2),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  delay: delayedAmount + 4000,
                ),
                SizedBox(
                  height: 50.0,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ManageProductCar.id);
                          },
                          child: Container(
                            height: 60,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.grey[100],
                            ),
                            child: Center(
                              child: Text(
                                'تعديل سيارة ',
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8185E2),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  delay: delayedAmount + 4000,
                ),
                SizedBox(
                  height: 50.0,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, OrderScreenCars.id);
                          },
                          child: Container(
                            height: 60,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.grey[100],
                            ),
                            child: Center(
                              child: Text(
                                'عرض طلبات ',
                                style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF8185E2),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  delay: delayedAmount + 4000,
                ),
                SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          )),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(AdminHomeCar.id);
  }

  void navigationPageHome() {
    Navigator.of(context).pushReplacementNamed(AdminHomeCar.id);
  }
}

// class AdminHomeCar extends StatelessWidget {
//   static String id = 'AdminHomeCar';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kmainColorcar,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           SizedBox(
//             width: double.infinity,
//           ),
//           RaisedButton(
//             onPressed: () {
//               Navigator.pushNamed(context, AddProductar.id);
//             },
//             child: Text('Add Product'),
//           ),
//           RaisedButton(
//             onPressed: () {
//               Navigator.pushNamed(context, ManageProductCar.id);
//             },
//             child: Text('Edit Product'),
//           ),
//           RaisedButton(
//             onPressed: () {
//               Navigator.pushNamed(context, OrderScreenCars.id);
//             },
//             child: Text('View orders'),
//           )
//         ],
//       ),
//     );
//   }
// }
