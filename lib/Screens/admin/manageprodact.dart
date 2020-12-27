import 'package:arhb_car_rental/Screens/admin/editProducts.dart';
import 'package:arhb_car_rental/Widgets/custom_menu.dart';
import 'package:arhb_car_rental/contants.dart';
import 'package:arhb_car_rental/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:arhb_car_rental/services/store.dart';

class ManageProduct extends StatefulWidget {
  static String id = 'ManageProduct';

  @override
  _ManageProductState createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = [];
            for (var doc in snapshot.data.documents) {
              var data = doc.data;
              products.add(Product(
                pcatcory: data[kpCatecoly],
                pdicription: data[kpDiscription],
                pimagelocation: data[kpImageLocation],
                pname: data[kpName],
                pprice: data[kpPrice],
                pId: doc.documentID,
              ));
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, indext) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTapUp: (details) async {
                    double dx = details.globalPosition.dx;
                    double dy = details.globalPosition.dy;
                    double dxWidth = MediaQuery.of(context).size.width - dx;
                    double dyHight = MediaQuery.of(context).size.height - dy;
                    await showMenu(
                        context: context,
                        position:
                            RelativeRect.fromLTRB(dx, dy, dxWidth, dyHight),
                        items: [
                          MyPopupMenuItem(
                            child: Text('Edit'),
                            onClick: () {
                              Navigator.pushNamed(context, EditProduct.id,
                                  arguments: products[indext]);
                            },
                          ),
                          MyPopupMenuItem(
                            child: Text('Delete'),
                            onClick: () {
                              _store.deleteProduct(products[indext].pId);

                              Navigator.pop(context);
                            },
                          ),
                        ]);
                  },
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(products[indext].pimagelocation),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: .6,
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    products[indext].pname,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('\$ ${products[indext].pprice}')
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              itemCount: products.length,
            );
          } else {
            return Center(
              child: Text('Loading...'),
            );
          }
        },
      ),
    );
  }
}
