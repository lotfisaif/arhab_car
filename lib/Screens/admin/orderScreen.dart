import 'package:arhb_car_rental/Screens/admin/order_details.dart';
import 'package:arhb_car_rental/contants.dart';
import 'package:arhb_car_rental/model/order.dart';
import 'package:arhb_car_rental/services/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  static String id = 'OrderScreen';
  final Store _store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadorder(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("there is no orders"),
              );
            } else {
              List<Order> orders = [];
              for (var doc in snapshot.data.documents) {
                orders.add(Order(
                    adress: doc.data[kAddress],
                    totalprice: doc.data[kTotallPrice],
                    documentId: doc.documentID));
              }
              return ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, OrderDetails.id,
                          arguments: orders[index].documentId);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * .2,
                      color: kSecondryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Totall Price = \$${orders[index].totalprice}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Address is ${orders[index].adress}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                itemCount: orders.length,
              );
            }
          }),
    );
  }
}
