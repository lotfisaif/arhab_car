import 'package:arhb_car_rental/Providers/adminmode.dart';
import 'package:arhb_car_rental/Providers/car/adminmodeCar.dart';
import 'package:arhb_car_rental/Providers/car/cartItemCar.dart';
import 'package:arhb_car_rental/Providers/car/modelhudCar.dart';
import 'package:arhb_car_rental/Providers/car/selectedCar.dart';
import 'package:arhb_car_rental/Providers/cartItem.dart';
import 'package:arhb_car_rental/Providers/modelhud.dart';
import 'package:arhb_car_rental/Screens/admin/addProduct.dart';
import 'package:arhb_car_rental/Screens/admin/adminHome.dart';
import 'package:arhb_car_rental/Screens/admin/car/addProductcar.dart';
import 'package:arhb_car_rental/Screens/admin/car/adminHomecar.dart';
import 'package:arhb_car_rental/Screens/admin/car/editProductscar.dart';
import 'package:arhb_car_rental/Screens/admin/car/manageprodactcar.dart';
import 'package:arhb_car_rental/Screens/admin/car/orderScreencar.dart';
import 'package:arhb_car_rental/Screens/admin/car/order_detailscar.dart';
import 'package:arhb_car_rental/Screens/admin/editProducts.dart';
import 'package:arhb_car_rental/Screens/admin/manageprodact.dart';
import 'package:arhb_car_rental/Screens/admin/orderScreen.dart';
import 'package:arhb_car_rental/Screens/loginScreen.dart';
import 'package:arhb_car_rental/Screens/sign_up_screen.dart';
import 'package:arhb_car_rental/Screens/user/CartScreen.dart';
import 'package:arhb_car_rental/Screens/user/cars/CartScreencar.dart';
import 'package:arhb_car_rental/Screens/user/cars/homePageCar.dart';
import 'package:arhb_car_rental/Screens/user/cars/productInfocar.dart';
import 'package:arhb_car_rental/Screens/user/homePage.dart';
import 'package:arhb_car_rental/Screens/user/productInfo.dart';
import 'package:arhb_car_rental/addphoto.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/bbokdirection.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/instructionCar.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/map.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/showroom.dart';
import 'package:arhb_car_rental/contants.dart';
import 'package:arhb_car_rental/splash/Screen/AnimatedSplashScreen.dart';
import 'package:arhb_car_rental/splash/Screen/IntroPage.dart';
import 'package:arhb_car_rental/splash/Screen/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: Text(''),
              ),
            ),
          );
        } else {
          isUserLoggedIn = snapshot.data.getBool(kKeepMeLoggedIn) ?? false;

          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ModalHud>(
                create: (context) => ModalHud(),
              ),
              ChangeNotifierProvider<CartItem>(
                create: (context) => CartItem(),
              ),
              ChangeNotifierProvider<Admin>(
                create: (context) => Admin(),
              ),
              ChangeNotifierProvider<ModalHudCar>(
                create: (context) => ModalHudCar(),
              ),
              ChangeNotifierProvider<CartItemCar>(
                create: (context) => CartItemCar(),
              ),
              ChangeNotifierProvider<AdminCar>(
                create: (context) => AdminCar(),
              ),
              ChangeNotifierProvider<SelectedCar>(
                create: (context) => SelectedCar(),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              //initialRoute: isUserLoggedIn ? HomePage.id : LoginScreen.id,AnimatedSplashScreen()
              initialRoute: isUserLoggedIn
                  ? AnimatedSplashHScreen.id
                  : AnimatedSplashScreen.id,
              routes: {
                // Ord.id: (context) => OrderDetails(),
                AnimatedSplashHScreen.id: (context) => AnimatedSplashHScreen(),

                // MyAppMap.id: (context) => MyAppMap(),
                OrderScreen.id: (context) => OrderScreen(),
                Showroom.id: (context) => Showroom(),
                MyAppAdd.id: (context) => MyAppAdd(),
                CartScreen.id: (context) => CartScreen(),
                ProductInfo.id: (context) => ProductInfo(),
                EditProduct.id: (context) => EditProduct(),
                ManageProduct.id: (context) => ManageProduct(),
                // InstructionCar.id: (context) => InstructionCar(),
                BookDirection.id: (context) => BookDirection(),

                SignupScreen.id: (context) => SignupScreen(),
                HomePage.id: (context) => HomePage(),
                AdminHome.id: (context) => AdminHome(),
                AddProduct.id: (context) => AddProduct(),
                IntroPage.id: (context) => IntroPage(),
                AnimatedSplashScreen.id: (context) => AnimatedSplashScreen(),
                LoginPage.id: (context) => LoginPage(),
                Login.id: (context) => Login(),
                // CartScreenCar.id: (context) => CartScreenCar(),
                ProductInfoCar.id: (context) => ProductInfoCar(),
                HomePageCar.id: (context) => HomePageCar(),
                OrderScreenCars.id: (context) => OrderScreenCars(),
                OrderDetailsCar.id: (context) => OrderDetailsCar(),
                ManageProductCar.id: (context) => ManageProductCar(),
                EditProductCar.id: (context) => EditProductCar(),
                AdminHomeCar.id: (context) => AdminHomeCar(),
                AddProductar.id: (context) => AddProductar(),
              },
            ),
          );
        }
      },
    );
  }
}
