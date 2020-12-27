import 'package:arhb_car_rental/Providers/car/cartItemCar.dart';
import 'package:arhb_car_rental/Screens/user/cars/CartScreencar.dart';
import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductInfoCar extends StatefulWidget {
  static String id = 'ProductInfoCar';
  @override
  _ProductInfoCarState createState() => _ProductInfoCarState();
}

class _ProductInfoCarState extends State<ProductInfoCar> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    ProductCarItem productcar = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          //   child: Image(
          //     fit: BoxFit.fill,
          //     image: AssetImage(productcar.path),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(
              height: MediaQuery.of(context).size.height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(context, CartScreenCar.id);
                      },
                      child: Icon(Icons.shopping_cart))
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: <Widget>[
                Opacity(
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .3,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            productcar.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            productcar.brand,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '\$${productcar.price}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ClipOval(
                                child: Material(
                                  color: kmainColorcar,
                                  child: GestureDetector(
                                    onTap: add,
                                    child: SizedBox(
                                      child: Icon(Icons.add),
                                      height: 32,
                                      width: 32,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _quantity.toString(),
                                style: TextStyle(fontSize: 60),
                              ),
                              ClipOval(
                                child: Material(
                                  color: kmainColorcar,
                                  child: GestureDetector(
                                    onTap: subtract,
                                    child: SizedBox(
                                      child: Icon(Icons.remove),
                                      height: 32,
                                      width: 32,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  opacity: .5,
                ),
                ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .08,
                  child: Builder(
                    builder: (context) => RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      color: kmainColorcar,
                      onPressed: () {
                        addToCart(context, productcar);
                      },
                      child: Text(
                        'Add to Cart'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  subtract() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        print(_quantity);
      });
    }
  }

  add() {
    setState(() {
      _quantity++;
      print(_quantity);
    });
  }

  void addToCart(context, productcar) {
    CartItemCar cartItemcar = Provider.of<CartItemCar>(context, listen: false);
    productcar.cQuantitycar = _quantity;
    bool exist = false;
    var productsInCartcar = cartItemcar.productscar;
    try {
      for (var productInCart in productsInCartcar) {
        if (productInCart.title == productcar.title) {
          exist = true;
        }
      }
      if (exist) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('you\'ve added this item before'),
        ));
      } else {
        cartItemcar.addProductcar(productcar);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Added to Cart'),
        ));
      }
    } catch (e) {}
  }
}
