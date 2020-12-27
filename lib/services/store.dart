import 'package:arhb_car_rental/contants.dart';
import 'package:arhb_car_rental/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final Firestore _firestore = Firestore.instance;

  addproduct(Product product) {
    _firestore.collection(kcollictionProduct).add({
      kpName: product.pname,
      kpDiscription: product.pdicription,
      kpImageLocation: product.pimagelocation,
      kpCatecoly: product.pcatcory,
      kpPrice: product.pprice
    });
  }

  Stream<QuerySnapshot> loadProduct() {
    return _firestore.collection(kcollictionProduct).snapshots();
  }

  Stream<QuerySnapshot> loadorder() {
    return _firestore.collection(kOrders).snapshots();
  }

  Stream<QuerySnapshot> loadOrderDetails(documentId) {
    return _firestore
        .collection(kOrders)
        .document(documentId)
        .collection(kOrderDetails)
        .snapshots();
  }

  deleteProduct(documentId) {
    _firestore.collection(kcollictionProduct).document(documentId).delete();
  }

  ditProduct(data, documentId) {
    _firestore
        .collection(kcollictionProduct)
        .document(documentId)
        .updateData(data);
  }

  storeOrders(data, List<Product> products) {
    var documentRef = _firestore.collection(kOrders).document();
    documentRef.setData(data);
    for (var product in products) {
      documentRef.collection(kOrderDetails).document().setData({
        kpName: product.pname,
        kpPrice: product.pprice,
        kProductQuantity: product.pQuantity,
        kpImageLocation: product.pimagelocation,
        kpCatecoly: product.pcatcory
      });
    }
  }
}
