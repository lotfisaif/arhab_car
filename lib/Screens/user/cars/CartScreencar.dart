import 'dart:ui';

import 'package:arhb_car_rental/Providers/car/cartItemCar.dart';
import 'package:arhb_car_rental/Screens/user/cars/productInfocar.dart';
import 'package:arhb_car_rental/Widgets/car/custom_menucar.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class CartScreenCar extends StatelessWidget {
  static String id = 'CartScreenCar';
  @override
  Widget build(BuildContext context) {
    List<Car> productscar = Provider.of<CartItemCar>(context).productscar;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          LayoutBuilder(builder: (context, constrains) {
            if (productscar.isNotEmpty) {
              return Container(
                height: screenHeight -
                    statusBarHeight -
                    appBarHeight -
                    (screenHeight * .08),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: GestureDetector(
                        onTapUp: (details) {
                          showCustomMenu(details, context, productscar[index]);
                        },
                        child: Container(
                            height: screenHeight * .15,
                            child: Row(
                              children: <Widget>[
                                // CircleAvatar(
                                //   radius: screenHeight * .15 / 2,
                                //   backgroundImage:
                                //       AssetImage(productscar[index].path),
                                // ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              productscar[index].title,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '\$ ${productscar[index].price}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          //'20000000',
                                          productscar[index]
                                              .cQuantitycar
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            color: kSecondryColorcar),
                      ),
                    );
                  },
                  itemCount: productscar.length,
                ),
              );
            } else {
              return Container(
                height: screenHeight -
                    (screenHeight * .08) -
                    appBarHeight -
                    statusBarHeight,
                child: Center(
                  child: Text('Cart is Empty'),
                ),
              );
            }
          }),
          Builder(
            builder: (context) => ButtonTheme(
              minWidth: screenWidth,
              height: screenHeight * .08,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10))),
                onPressed: () {
                  showCustomDialog(productscar, context);
                },
                child: Text('Order'.toUpperCase()),
                color: kmainColorcar,
              ),
            ),
          )
        ],
      ),
    );
  }

  void showCustomMenu(details, context, productcar) async {
    double dx = details.globalPosition.dx;
    double dy = details.globalPosition.dy;
    double dx2 = MediaQuery.of(context).size.width - dx;
    double dy2 = MediaQuery.of(context).size.width - dy;
    await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
        items: [
          MyPopupMenuItem(
            onClick: () {
              Navigator.pop(context);
              Provider.of<CartItemCar>(context, listen: false)
                  .deleteProductcar(productcar);
              Navigator.pushNamed(context, ProductInfoCar.id,
                  arguments: productcar);
            },
            child: Text('Edit'),
          ),
          MyPopupMenuItem(
            onClick: () {
              Navigator.pop(context);
              Provider.of<CartItemCar>(context, listen: false)
                  .deleteProductcar(productcar);
            },
            child: Text('Delete'),
          ),
        ]);
  }

  void showCustomDialog(List<Car> productscar, context) async {
    var price = getTotallPrice(productscar);
    var address;
    AlertDialog alertDialog = AlertDialog(
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            try {
              StoreCar _store = StoreCar();
              _store.storeOrderscar(
                  {kTotallPricecar: price, kAddresscar: address}, productscar);

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Orderd Successfully'),
              ));
              Navigator.pop(context);
            } catch (ex) {
              print(ex.message);
            }
          },
          child: Text('Confirm'),
        )
      ],
      content: TextField(
        onChanged: (value) {
          address = value;
        },
        decoration: InputDecoration(hintText: 'Enter your Address'),
      ),
      title: Text('Totall Price  = \$ $price'),
    );
    await showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  getTotallPrice(List<Car> productscar) {
    var price = 0;
    for (var product in productscar) {
      price += product.cQuantitycar * int.parse(product.price);
    }
    return price;
  }
}
