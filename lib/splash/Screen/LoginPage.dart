import 'package:arhb_car_rental/Providers/car/adminmodeCar.dart';
import 'package:arhb_car_rental/Screens/admin/car/adminHomecar.dart';
import 'package:arhb_car_rental/Screens/user/cars/homePageCar.dart';
import 'package:arhb_car_rental/Screens/user/homePage.dart';
import 'package:arhb_car_rental/splash/Screen/Login.dart';
import 'package:arhb_car_rental/splash/delayed_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class LoginPage extends StatefulWidget {
  static String id = "LoginPage";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
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
          backgroundColor: Color(0xFF8185E2),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AvatarGlow(
                  endRadius: 90,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        radius: 50.0,
                      )),
                ),
                // DelayedAnimation(
                //   child: Text(
                //     "مرحبا بكم",
                //     style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //         fontSize: 35.0,
                //         color: color),
                //   ),
                //   delay: delayedAmount + 1000,
                // ),
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
                            navigationPage();
                          },
                          child: Container(
                            height: 60,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(
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
                            navigationPageHome();
                          },
                          child: Container(
                            height: 60,
                            width: 270,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'دخول كضيف',
                                style: TextStyle(
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
