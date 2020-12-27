import 'package:arhb_car_rental/Providers/modelhud.dart';
import 'package:arhb_car_rental/Screens/loginScreen.dart';
import 'package:arhb_car_rental/Screens/sign_up_screen.dart';
import 'package:arhb_car_rental/Screens/user/homePage.dart';
import 'package:arhb_car_rental/Widgets/cutomeTextField.dart';
import 'package:arhb_car_rental/services/auth.dart';
import 'package:arhb_car_rental/splash/FadeAnimation.dart';
import 'package:arhb_car_rental/splash/Screen/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'SignUpScreen';
  String _email, _password;
  final _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModalHud>(context).isloading,
          child: SingleChildScrollView(
            child: Form(
              key: _globalKey,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/splash/background.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: 80,
                            height: 200,
                            child: FadeAnimation(
                                1,
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/splash/light-1.png'))),
                                )),
                          ),
                          Positioned(
                            left: 140,
                            width: 80,
                            height: 150,
                            child: FadeAnimation(
                                1.3,
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/splash/light-2.png'))),
                                )),
                          ),
                          Positioned(
                            right: 40,
                            top: 40,
                            width: 80,
                            height: 150,
                            child: FadeAnimation(
                                1.5,
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/splash/clock.png'))),
                                )),
                          ),
                          Positioned(
                            child: FadeAnimation(
                                1.6,
                                Container(
                                  margin: EdgeInsets.only(top: 50),
                                  child: Center(
                                    child: Text(
                                      "SignUp",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
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
                                        hinttext: "Enter Your Name",
                                        icon: Icons.perm_identity,
                                      ),
                                    ),
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
                                          _password = value;
                                        },
                                        hinttext: "Password",
                                        icon: Icons.lock,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 30,
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
                                    onPressed: () async {
                                      final modelhud = Provider.of<ModalHud>(
                                          context,
                                          listen: false);
                                      modelhud.changeisloading(true);
                                      if (_globalKey.currentState.validate()) {
                                        _globalKey.currentState.save();
                                        try {
                                          final authResult = await _auth.signUp(
                                              _email.trim(), _password.trim());
                                          modelhud.changeisloading(false);
                                          Navigator.pushNamed(
                                              context, Login.id);
                                        } on PlatformException catch (e) {
                                          modelhud.changeisloading(false);
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(e.message),
                                          ));
                                        }
                                      }
                                    },
                                    child: Text(
                                      'SignUp',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FadeAnimation(
                            1.5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Your have an account ? ',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 16),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed(Login.id);
                                  },
                                  child: Text(
                                    "Login ",
                                    style: TextStyle(
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
