// import 'package:arhb_car_rental/Providers/adminmode.dart';
// import 'package:arhb_car_rental/Providers/modelhud.dart';
// import 'package:arhb_car_rental/Screens/admin/adminHome.dart';
// import 'package:arhb_car_rental/Screens/admin/car/adminHomecar.dart';
// import 'package:arhb_car_rental/Screens/sign_up_screen.dart';
// import 'package:arhb_car_rental/Screens/user/cars/homePageCar.dart';
// import 'package:arhb_car_rental/Screens/user/homePage.dart';
// import 'package:arhb_car_rental/Widgets/cutomeTextField.dart';
// import 'package:arhb_car_rental/contants.dart';
// import 'package:arhb_car_rental/services/auth.dart';
// import 'package:arhb_car_rental/splash/FadeAnimation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Login extends StatefulWidget {
//   static String id = "Login";
//   final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   String _email, password;

//   final _auth = Auth();

//   final adminPassword = 'Admin1234';

//   bool keepMeLoggedIn = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: ModalProgressHUD(
//           inAsyncCall: Provider.of<ModalHud>(context).isloading,
//           child: SingleChildScrollView(
//             child: Form(
//               key: widget.globalKey,
//               child: Container(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       height: 300,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage(
//                                   'images/splash/undraw_Login_re_4vu2.png'),
//                               fit: BoxFit.fill)),
//                       child: Stack(
//                         children: <Widget>[
//                           Positioned(
//                             left: 30,
//                             width: 80,
//                             height: 200,
//                             child: FadeAnimation(
//                                 1,
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                           image: AssetImage(
//                                               'images/splash/undraw_Login_re_4vu2.png'))),
//                                 )),
//                           ),
//                           Positioned(
//                             left: 140,
//                             width: 80,
//                             height: 150,
//                             child: FadeAnimation(
//                                 1.3,
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                           image: AssetImage(
//                                               'images/splash/light-2.png'))),
//                                 )),
//                           ),
//                           Positioned(
//                             right: 40,
//                             top: 40,
//                             width: 80,
//                             height: 150,
//                             child: FadeAnimation(
//                                 1.5,
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                           image: AssetImage(
//                                               'images/splash/clock.png'))),
//                                 )),
//                           ),
//                           Positioned(
//                             child: FadeAnimation(
//                                 1.6,
//                                 Container(
//                                   margin: EdgeInsets.only(top: 100, right: 250),
//                                   child: Center(
//                                     child: Text(
//                                       "Login",
//                                       style: TextStyle(
//                                           color: Colors.grey[350],
//                                           fontSize: 40,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                 )),
//                           )
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(20.0),
//                       child: Column(
//                         children: <Widget>[
//                           FadeAnimation(
//                               1.8,
//                               Container(
//                                 padding: EdgeInsets.all(5),
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(10),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color:
//                                               Color.fromRGBO(143, 148, 251, .2),
//                                           blurRadius: 20.0,
//                                           offset: Offset(0, 10))
//                                     ]),
//                                 child: Column(
//                                   children: <Widget>[
//                                     Container(
//                                       padding: EdgeInsets.all(8.0),
//                                       decoration: BoxDecoration(
//                                           border: Border(
//                                               bottom: BorderSide(
//                                                   color: Colors.grey[100]))),
//                                       child: CustomTextfield(
//                                         onclick: (value) {
//                                           _email = value;
//                                         },
//                                         hinttext: "Email",
//                                         icon: Icons.email,
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.all(8.0),
//                                       child: CustomTextfield(
//                                         onclick: (value) {
//                                           password = value;
//                                         },
//                                         hinttext: "Password",
//                                         icon: Icons.lock,
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.all(8.0),
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: <Widget>[
//                                           Text(
//                                             'يذكرني ',
//                                             style: TextStyle(
//                                                 color: Colors.grey[400]),
//                                           ),
//                                           Theme(
//                                             data: ThemeData(
//                                                 unselectedWidgetColor:
//                                                     Color.fromRGBO(
//                                                         143, 148, 251, 1)),
//                                             child: Checkbox(
//                                               checkColor: Color.fromRGBO(
//                                                   143, 148, 251, 1),
//                                               activeColor: Colors.grey[100],
//                                               value: keepMeLoggedIn,
//                                               onChanged: (value) {
//                                                 setState(() {
//                                                   keepMeLoggedIn = value;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           // FadeAnimation(
//                           //   3,
//                           //   Padding(
//                           //     padding: EdgeInsets.symmetric(
//                           //         horizontal: 30, vertical: 10),
//                           //     child: Row(
//                           //       children: <Widget>[
//                           //         Expanded(
//                           //           child: GestureDetector(
//                           //             onTap: () {
//                           //               Provider.of<Admin>(context,
//                           //                       listen: false)
//                           //                   .changeadmin(true);
//                           //             },
//                           //             child: Text(
//                           //               'i\'m an admin',
//                           //               textAlign: TextAlign.center,
//                           //               style: TextStyle(
//                           //                 fontSize: Provider.of<Admin>(context)
//                           //                         .isAdmin
//                           //                     ? 20
//                           //                     : 15,
//                           //                 color: Provider.of<Admin>(context)
//                           //                         .isAdmin
//                           //                     ? Color.fromRGBO(143, 148, 251, 1)
//                           //                     : Colors.grey[400],
//                           //               ),
//                           //             ),
//                           //           ),
//                           //         ),
//                           //         Expanded(
//                           //           child: GestureDetector(
//                           //             onTap: () {
//                           //               Provider.of<Admin>(context,
//                           //                       listen: false)
//                           //                   .changeadmin(false);
//                           //             },
//                           //             child: Text(
//                           //               'i\'m a user',
//                           //               textAlign: TextAlign.center,
//                           //               style: TextStyle(
//                           //                 fontSize: Provider.of<Admin>(context)
//                           //                         .isAdmin
//                           //                     ? 15
//                           //                     : 20,
//                           //                 color: Provider.of<Admin>(context,
//                           //                             listen: true)
//                           //                         .isAdmin
//                           //                     ? Colors.grey[400]
//                           //                     : Color.fromRGBO(
//                           //                         143, 148, 251, 1),
//                           //               ),
//                           //             ),
//                           //           ),
//                           //         ),
//                           //       ],
//                           //     ),
//                           //   ),
//                           // ),

//                           SizedBox(
//                             height: 15,
//                           ),
//                           FadeAnimation(
//                             2,
//                             Container(
//                               height: 50,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   gradient: LinearGradient(colors: [
//                                     Color.fromRGBO(143, 148, 251, 1),
//                                     Color.fromRGBO(143, 148, 251, .6),
//                                   ])),
//                               child: Center(
//                                 child: Builder(
//                                   builder: (context) => FlatButton(
//                                     onPressed: () {
//                                       if (keepMeLoggedIn == true) {
//                                         keepUserLoggedIn();
//                                       }

//                                       _validate(context);
//                                     },
//                                     child: Text(
//                                       'Login',
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             height: 32,
//                           ),
//                           FadeAnimation(
//                             1.5,
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text(
//                                   'Don\'t have an account ? ',
//                                   style: TextStyle(
//                                     letterSpacing: 3.0,
//                                     color: Colors.grey[400],
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.of(context)
//                                         .pushReplacementNamed(SignupScreen.id);
//                                   },
//                                   child: Text(
//                                     "SignUp ",
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         letterSpacing: 3.0,
//                                         fontSize: 20,
//                                         color:
//                                             Color.fromRGBO(143, 148, 251, 1)),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }

//   void _validate(BuildContext context) async {
//     final modelhud = Provider.of<ModalHud>(context, listen: false);
//     modelhud.changeisloading(true);
//     if (widget.globalKey.currentState.validate()) {
//       widget.globalKey.currentState.save();
//       //  if (Provider.of<Admin>(context, listen: false).isAdmin)

//       if (password == adminPassword) {
//         try {
//           await _auth.signIn(_email.trim(), password.trim());
//           Navigator.of(context).pushReplacementNamed(AdminHomeCar.id);
//         } catch (e) {
//           modelhud.changeisloading(false);
//           Scaffold.of(context).showSnackBar(SnackBar(
//             content: Text(e.message),
//             backgroundColor: Colors.redAccent,
//           ));
//         }
//       } else {
//         try {
//           await _auth.signIn(_email.trim(), password.trim());
//           Navigator.of(context).pushReplacementNamed(HomePageCar.id);
//         } catch (e) {
//           Scaffold.of(context).showSnackBar(SnackBar(
//             content: Text(e.message),
//             backgroundColor: Colors.redAccent,
//           ));
//         }
//       }
//     }
//     modelhud.changeisloading(false);
//   }

//   void keepUserLoggedIn() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setBool(kKeepMeLoggedIn, keepMeLoggedIn);
//   }
// }
