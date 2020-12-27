import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderDetailsCar extends StatefulWidget {
  static String id = 'OrderDetailsCar';

  @override
  _OrderDetailsCarState createState() => _OrderDetailsCarState();
}

class _OrderDetailsCarState extends State<OrderDetailsCar> {
  StoreCar store = StoreCar();

  @override
  Widget build(BuildContext context) {
    String documentId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: store.loadOrderDetailscar(documentId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductCarItem> productscar = [];
              for (var doc in snapshot.data.documents) {
                productscar.add(ProductCarItem(
                  title: doc.data[ktitle],
                  cQuantitycar: doc.data[kProductQuantitycar],
                  brand: doc.data[kbrand],
                ));
              }

              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * .2,
                          color: kSecondryColorcar,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                    'product name : ${productscar[index].title}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                // Text(
                                //   'Quantity : ${productscar[index].cQuantitycar}',
                                //   style: TextStyle(
                                //       fontSize: 18,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'product Category : ${productscar[index].brand}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      itemCount: productscar.length,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Expanded(
                  //         child: ButtonTheme(
                  //           buttonColor: kmainColorcar,
                  //           child: RaisedButton(
                  //             onPressed: () {},
                  //             child: Text('Confirm Order'),
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         width: 10,
                  //       ),
                  //       Expanded(
                  //         child: ButtonTheme(
                  //           buttonColor: kmainColorcar,
                  //           child: RaisedButton(
                  //             onPressed: () {},
                  //             child: Text('Delete Order'),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              );
            } else {
              return Center(
                child: Text('Loading Order Details'),
              );
            }
          }),
    );
  }
}
