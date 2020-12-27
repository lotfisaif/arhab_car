import 'package:arhb_car_rental/Screens/admin/addProduct.dart';
import 'package:arhb_car_rental/Screens/admin/manageprodact.dart';
import 'package:arhb_car_rental/Screens/admin/orderScreen.dart';
import 'package:arhb_car_rental/contants.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  static String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kmainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProduct.id);
            },
            child: Text('Add Product'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, ManageProduct.id);
            },
            child: Text('Edit Product'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, OrderScreen.id);
            },
            child: Text('View orders'),
          )
        ],
      ),
    );
  }
}
