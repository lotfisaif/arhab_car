import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/contants.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:arhb_car_rental/splash/FadeAnimation.dart';
import 'package:flutter/material.dart';

class InfoBook extends StatefulWidget {
  final Car car;
  final String price;
  final String address;

  InfoBook({@required this.car, @required this.price, @required this.address});
  @override
  _InfoBookState createState() => _InfoBookState();
}

class _InfoBookState extends State<InfoBook> {
  var numPhone;
  List<Car> carBook = [];
  @override
  Widget build(BuildContext context) {
    carBook.add(widget.car);
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
            if (carBook.isNotEmpty) {
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
                          // showCustomMenu(details, context, products[index]);
                        },
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    FadeAnimation(
                                        2,
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(
                                                        143, 148, 251, .2),
                                                    blurRadius: 20.0,
                                                    offset: Offset(0, 10))
                                              ]),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 300,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                  image: NetworkImage(
                                                    carBook[index]
                                                        .imageUrlsCar[0],
                                                  ),
                                                  //  AssetImage(
                                                  //     'images/splash/undraw_town_r6pc.png'),
                                                  // fit: BoxFit.fill
                                                )),
                                              ),
                                              Text(
                                                widget.car.title,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Pacifico',
                                                  color: Colors.grey[600],
                                                ),
                                                // textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                widget.car.brand,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Pacifico',
                                                  color: Colors.grey[600],
                                                ),
                                                // textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                '\$ ${widget.price}',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Pacifico',
                                                  color: Colors.grey[500],
                                                ),
                                                // textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                widget.address,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Pacifico',
                                                  color: Colors.grey[400],
                                                ),
                                                // textAlign: TextAlign.left,
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              TextFormField(
                                                keyboardType:
                                                    TextInputType.number,
                                                // validator: (value) {
                                                //   if (value.isEmpty) {
                                                //     return Messageserror(hinttext);
                                                //   }
                                                // },
                                                onSaved: (val) {
                                                  setState(() {
                                                    numPhone = val;
                                                  });
                                                },

                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Your Phone",
                                                  hintStyle: TextStyle(
                                                      color: Color.fromRGBO(
                                                          143, 148, 251, 1),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 2.0),
                                                  suffixIcon: Icon(
                                                    Icons.mobile_screen_share,
                                                    color: Color.fromRGBO(
                                                        143, 148, 251, 1),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    // FadeAnimation(
                                    //   3,
                                    //   Container(
                                    //     height: 50,
                                    //     decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.circular(10),
                                    //         gradient: LinearGradient(colors: [
                                    //           Color.fromRGBO(143, 148, 251, 1),
                                    //           Color.fromRGBO(143, 148, 251, .6),
                                    //         ])),
                                    //     child: Center(
                                    //       child: Builder(
                                    //         builder: (context) => FlatButton(
                                    //           onPressed: () {
                                    //             Navigator.push(
                                    //                 context,
                                    //                 MaterialPageRoute(
                                    //                   builder: (context) =>
                                    //                       RealtimeMapScrren(
                                    //                     car: widget.car,
                                    //                     price: widget.price,
                                    //                   ),
                                    //                 ));
                                    //           },
                                    //           child: Text(
                                    //             'Next',
                                    //             style: TextStyle(
                                    //                 color: Colors.white,
                                    //                 fontWeight: FontWeight.bold,
                                    //                 fontSize: 20,
                                    //                 letterSpacing: 3),
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),

                                    SizedBox(
                                      height: 32,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Container(
                        //     height: screenHeight * .15,
                        //     child: Row(
                        //       children: <Widget>[
                        //         CircleAvatar(
                        //           radius: screenHeight * .15 / 2,
                        //           backgroundImage: NetworkImage(
                        //               carBook[index].imageUrlsCar[0]),
                        //         ),
                        //         Expanded(
                        //           child: Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceBetween,
                        //             children: <Widget>[
                        //               Padding(
                        //                 padding:
                        //                     const EdgeInsets.only(left: 10),
                        //                 child: Column(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.center,
                        //                   children: <Widget>[
                        //                     Text(
                        //                       carBook[index].title,
                        //                       style: TextStyle(
                        //                           fontSize: 18,
                        //                           fontWeight: FontWeight.bold),
                        //                     ),
                        //                     SizedBox(
                        //                       height: 10,
                        //                     ),
                        //                     Text(
                        //                       '\$ ${widget.price}',
                        //                       style: TextStyle(
                        //                           fontWeight: FontWeight.bold),
                        //                     )
                        //                   ],
                        //                 ),
                        //               ),
                        //               Padding(
                        //                 padding:
                        //                     const EdgeInsets.only(right: 20),
                        //                 child: Text(
                        //                   //'20000000',
                        //                   carBook[index].brand,
                        //                   style: TextStyle(
                        //                       fontSize: 16,
                        //                       fontWeight: FontWeight.bold),
                        //                 ),
                        //               )
                        //             ],
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //     color: kSecondryColor),
                      ),
                    );
                  },
                  itemCount: carBook.length,
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
                  try {
                    StoreCar _store = StoreCar();
                    _store.storeOrderscar(
                        {kTotallPrice: widget.price, kAddress: widget.address},
                        carBook);
                    // _store.storeOrderscar(
                    //     {kTotallPrice: price, kAddress: address}, products);

                    Scaffold.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 15),
                      content: Text('Orderd Successfully'),
                    ));
                    // Navigator.pop(context);
                  } catch (ex) {
                    print(ex.message);
                  }
                },
                child: Text('Order'.toUpperCase()),
                color: kmainColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  // void showCustomMenu(details, context, product) async {
  //   double dx = details.globalPosition.dx;
  //   double dy = details.globalPosition.dy;
  //   double dx2 = MediaQuery.of(context).size.width - dx;
  //   double dy2 = MediaQuery.of(context).size.width - dy;
  //   await showMenu(
  //       context: context,
  //       position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
  //       items: [
  //         MyPopupMenuItem(
  //           onClick: () {
  //             Navigator.pop(context);
  //             Provider.of<CartItem>(context, listen: false)
  //                 .deleteProduct(product);
  //             Navigator.pushNamed(context, ProductInfo.id, arguments: product);
  //           },
  //           child: Text('Edit'),
  //         ),
  //         MyPopupMenuItem(
  //           onClick: () {
  //             Navigator.pop(context);
  //             Provider.of<CartItem>(context, listen: false)
  //                 .deleteProduct(product);
  //           },
  //           child: Text('Delete'),
  //         ),
  //       ]);
  // }

  // void showCustomDialog(List<Product> products, context) async {
  //   var price = getTotallPrice(products);
  //   var address;
  //   AlertDialog alertDialog = AlertDialog(
  //     actions: <Widget>[
  //       MaterialButton(
  //         onPressed: () {
  //           try {
  //             Store _store = Store();
  //             _store.storeOrders(
  //                 {kTotallPrice: price, kAddress: address}, products);

  //             Scaffold.of(context).showSnackBar(SnackBar(
  //               content: Text('Orderd Successfully'),
  //             ));
  //             Navigator.pop(context);
  //           } catch (ex) {
  //             print(ex.message);
  //           }
  //         },
  //         child: Text('Confirm'),
  //       )
  //     ],
  //     content: TextField(
  //       onChanged: (value) {
  //         address = value;
  //       },
  //       decoration: InputDecoration(hintText: 'Enter your Address'),
  //     ),
  //     title: Text('Totall Price  = \$ $price'),
  //   );
  //   await showDialog(
  //       context: context,
  //       builder: (context) {
  //         return alertDialog;
  //       });
  // }

  // getTotallPrice(List<Product> products) {
  //   var price = 0;
  //   for (var product in products) {
  //     price += product.pQuantity * int.parse(product.pprice);
  //   }
  //   return price;
  // }

}
