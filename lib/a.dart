import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewImages extends StatelessWidget {
  List<NetworkImage> _listOfImages = <NetworkImage>[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Flexible(
            child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('images').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          _listOfImages = [];
                          for (int i = 0;
                              i <
                                  snapshot.data.documents[index].data['urls']
                                      .length;
                              i++) {
                            _listOfImages.add(NetworkImage(snapshot
                                .data.documents[index].data['urls'][i]));
                          }
                          return Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10.0),
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Carousel(
                                    boxFit: BoxFit.cover,
                                    images: _listOfImages,
                                    autoplay: false,
                                    indicatorBgPadding: 5.0,
                                    dotPosition: DotPosition.bottomCenter,
                                    animationCurve: Curves.fastOutSlowIn,
                                    animationDuration:
                                        Duration(milliseconds: 2000)),
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.red,
                              )
                            ],
                          );
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }))
      ],
    );
  }
}

//      StreamBuilder<QuerySnapshot>(
//
//        stream: _store.loadProductCar(),
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            List<ProductCarItem> productscar = [];
//            for (var doc in snapshot.data.documents) {
//              var data = doc.data;
//              productscar.add(ProductCarItem(
//                pId: doc.documentID,
//                title: data[ktitle],
//                price: data[kprice],
//                brand: data[kbrand],
//                path: data[kpath],
//                color: data[kcolor],
//                adaptor: data[kadaptor],
//                cardoor: data[kcardoor],
//                evaluation: data[kevaluation],
//                fuelLiter: data[kfuelLiter],
//                gearbox: data[kgearbox],
//                jeer: data[kjeer],
//                speedKilo: data[kspeedKilo],
//                travellingBagLarge: data[ktravellingBagLarge],
//                travellingBagSmal: data[ktravellingBagSmal],
//                typeFuel: data[ktypeFuel],
//                numCar: data[knumCar],
//                imageUrlsCar: data[kimageUrlcar],
//              ));
//            }
//            _productscar = [...productscar];
//
//            productscar.clear();
//            productscar = getProductByCategoryCar(kHonda, _productscar);
//
//            return Text('data');
//
//            //  ListView.builder(
//            //     itemCount: productscar.length,
//            //     itemBuilder: (BuildContext context, int index) {
//            //       _listOfImages = [];]
//            //       for (int i = 0;
//            //           i <
//            //               snapshot.data.documents[index]
//            //                   .data[kimageUrlcar].length;
//            //           i++) {
//            //         _listOfImages.add(NetworkImage(snapshot.data
//            //             .documents[index].data[kimageUrlcar][i]));
//            //       }
//            //       return Column(
//            //         children: <Widget>[
//            //           Container(
//            //             margin: EdgeInsets.all(10.0),
//            //             height: 200,
//            //             decoration: BoxDecoration(
//            //               color: Colors.white,
//            //             ),
//            //             width: MediaQuery.of(context).size.width,
//            //             child: Carousel(
//            //                 boxFit: BoxFit.cover,
//            //                 images: _listOfImages,
//            //                 autoplay: false,
//            //                 indicatorBgPadding: 5.0,
//            //                 dotPosition: DotPosition.bottomCenter,
//            //                 animationCurve: Curves.fastOutSlowIn,
//            //                 animationDuration:
//            //                     Duration(milliseconds: 2000)),
//            //           ),
//            //           Container(
//            //             height: 1,
//            //             width: MediaQuery.of(context).size.width,
//            //             color: Colors.red,
//            //           )
//            //         ],
//            //       );
//            //     });
//
//          } else {
//            return Center(
//              child: CircularProgressIndicator(),
//            );
//          }
//        });
//

//    Widget H() {
//      return StreamBuilder<QuerySnapshot>(
//        stream: _store.loadProductCar(),
//        builder: (context, snapshot) {
//          if (snapshot.hasData) {
//            List<ProductCarItem> productscar = [];
//            for (var doc in snapshot.data.documents) {
//              var data = doc.data;
//              productscar.add(ProductCarItem(
//                pId: doc.documentID,
//                title: data[ktitle],
//                price: data[kprice],
//                brand: data[kbrand],
//                path: data[kpath],
//                color: data[kcolor],
//                adaptor: data[kadaptor],
//                cardoor: data[kcardoor],
//                evaluation: data[kevaluation],
//                fuelLiter: data[kfuelLiter],
//                gearbox: data[kgearbox],
//                jeer: data[kjeer],
//                speedKilo: data[kspeedKilo],
//                travellingBagLarge: data[ktravellingBagLarge],
//                travellingBagSmal: data[ktravellingBagSmal],
//                typeFuel: data[ktypeFuel],
//                numCar: data[knumCar],
//                imageUrlsCar: data[kimageUrlcar],
//              ));
//            }
//            _productscar = [...productscar];
//
//            productscar.clear();
//            productscar = getProductByCategoryCar(kHonda, _productscar);
//            return GridView.builder(
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2,
//                childAspectRatio: .8,
//              ),
//              itemCount: productscar.length,
//              itemBuilder: (context, index) => Padding(
//                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                child: GestureDetector(
//                  onTap: () {
//                    Navigator.pushNamed(context, ProductInfoCar.id,
//                        arguments: productscar[index]);
//                  },
//                  child: Stack(
//                    children: <Widget>[
//                      Text('data')
//                      // Positioned.fill(
//                      //   child: Image(
//                      //     fit: BoxFit.fill,
//                      //     image: NetworkImage(productscar[index].imageUrlsCar[1]),
//                      //   ),
//                      // ),
//                      // // Positioned(
//                      //   bottom: 0,
//                      //   child: Opacity(
//                      //     opacity: .6,
//                      //     child: Container(
//                      //       width: MediaQuery.of(context).size.width,
//                      //       height: 60,
//                      //       color: Colors.white,
//                      //       child: Padding(
//                      //         padding: EdgeInsets.symmetric(
//                      //             horizontal: 10, vertical: 5),
//                      //         child: Column(
//                      //           crossAxisAlignment: CrossAxisAlignment.start,
//                      //           children: <Widget>[
//                      //             Text(
//                      //               productscar[index].title,
//                      //               style: TextStyle(fontWeight: FontWeight.bold),
//                      //             ),
//                      //             Text('\$ ${productscar[index].price}')
//                      //           ],
//                      //         ),
//                      //       ),
//                      //     ),
//                      //   ),
//                      // )
//                    ],
//                  ),
//                ),
//              ),
//            );
//          } else {
//            return Center(
//                child: Text(
//              'Loading...',
//              style: TextStyle(fontSize: 50),
//            ));
//          }
//        },
//      );
//    }

// Container(
//   height: 400,
//   width: double.infinity,
//   child: ListView(
//     scrollDirection: Axis.horizontal,
//     children: <Widget>[
//       Widgetphoto(),
//       Widgetphoto(),
//       Widgetphoto(),
//       Widgetphoto(),
//       Widgetphoto(),
//     ],
//   ),
// ),

// Padding(
//   padding: const EdgeInsets.only(right: 30),
//   child: Stack(
//     children: <Widget>[
//       CircleAvatar(
//         maxRadius: 20,
//         minRadius: 20,
//         child: Icon(Icons.shopping_cart),
//         backgroundColor: Color(0xff026f4f),
//       ),
//       Positioned(
//         bottom: 0,
//         child: CircleAvatar(
//           maxRadius: 10,
//           minRadius: 10,
//           child: Text("8"),
//           backgroundColor: Color(0xffef5029),
//         ),
//       ),
//     ],
//   ),
// )
