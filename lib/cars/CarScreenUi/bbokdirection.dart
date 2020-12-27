import 'package:arhb_car_rental/Providers/adminmode.dart';
import 'package:arhb_car_rental/Providers/modelhud.dart';
import 'package:arhb_car_rental/Screens/admin/adminHome.dart';
import 'package:arhb_car_rental/Screens/admin/car/adminHomecar.dart';
import 'package:arhb_car_rental/Screens/sign_up_screen.dart';
import 'package:arhb_car_rental/Screens/user/cars/homePageCar.dart';
import 'package:arhb_car_rental/Screens/user/homePage.dart';
import 'package:arhb_car_rental/Widgets/cutomeTextField.dart';
import 'package:arhb_car_rental/contants.dart';
import 'package:arhb_car_rental/services/auth.dart';
import 'package:arhb_car_rental/splash/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class BookDirection extends StatefulWidget {
  static String id = "BookDirection";
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  _BookDirectionState createState() => _BookDirectionState();
}

class _BookDirectionState extends State<BookDirection> {
  String _email, password;

  final _auth = Auth();

  final adminPassword = 'Admin1234';

  bool keepMeLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModalHud>(context).isloading,
          child: SingleChildScrollView(
            child: Form(
              key: widget.globalKey,
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      ":     إستلام السيارة  ",
                      style: TextStyle(
                        backgroundColor: Colors.grey[200],
                        fontSize: 17,
                        fontFamily: 'Pacifico',
                        color: Colors.black45,
                      ),
                      //textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                              1.8,
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10))
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]))),
                                      child: CustomTextfield(
                                        onclick: (value) {
                                          _email = value;
                                        },
                                        hinttext: "Email",
                                        icon: Icons.email,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: CustomTextfield(
                                        onclick: (value) {
                                          password = value;
                                        },
                                        hinttext: "Password",
                                        icon: Icons.lock,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'يذكرني ',
                                            style: TextStyle(
                                                color: Colors.grey[400]),
                                          ),
                                          Theme(
                                            data: ThemeData(
                                                unselectedWidgetColor:
                                                    Color.fromRGBO(
                                                        143, 148, 251, 1)),
                                            child: Checkbox(
                                              checkColor: Color.fromRGBO(
                                                  143, 148, 251, 1),
                                              activeColor: Colors.grey[100],
                                              value: keepMeLoggedIn,
                                              onChanged: (value) {
                                                setState(() {
                                                  keepMeLoggedIn = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
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
                            2,
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
                                    onPressed: () {},
                                    child: Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          FadeAnimation(
                            1.5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Don\'t have an account ? ',
                                  style: TextStyle(
                                    letterSpacing: 3.0,
                                    color: Colors.grey[400],
                                    fontSize: 18,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed(SignupScreen.id);
                                  },
                                  child: Text(
                                    "SignUp ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 3.0,
                                        fontSize: 20,
                                        color:
                                            Color.fromRGBO(143, 148, 251, 1)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
