import 'package:arhb_car_rental/Screens/admin/car/order_detailscar.dart';
import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/model/cars/ordercar.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderScreenCars extends StatelessWidget {
  static String id = 'OrderScreenCars';
  final StoreCar _store = StoreCar();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadorderCar(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("there is no orders"),
              );
            } else {
              List<OrderCar> orderscar = [];
              for (var doc in snapshot.data.documents) {
                orderscar.add(OrderCar(
                    adresscar: doc.data[kAddresscar],
                    documentIdcar: doc.documentID,
                    totalpricecar: doc.data[kTotallPricecar],
                    numphone: null));
              }
              return ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, OrderDetailsCar.id,
                          arguments: orderscar[index].documentIdcar);
                    },
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        height: MediaQuery.of(context).size.height * .2,
                        color: kSecondryColorcar,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Text(
                              //   'السعر  = \$${orderscar[index].documentIdcar}',
                              //   style: TextStyle(
                              //       fontSize: 18,
                              //       fontWeight: FontWeight.bold)),
                              Text(
                                  'السعر  = \$${orderscar[index].totalpricecar}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                ' العنوان ${orderscar[index].adresscar}',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                itemCount: orderscar.length,
              );
            }
          }),
    );
  }
}
