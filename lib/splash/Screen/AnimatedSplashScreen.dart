import 'dart:async';
import 'package:arhb_car_rental/splash/Screen/IntroPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen();
  }
}

class AnimatedSplashScreen extends StatefulWidget {
  static String id = "AnimatedSplashScreen";
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() {
    var _duration = new Duration(seconds: 9);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(IntroPage.id);
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
