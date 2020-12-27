import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/cars/contantnsCars.dart';

import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';
import 'package:arhb_car_rental/model/cars/userinformtion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreCar {
  final Firestore _firestore = Firestore.instance;

  addproductCar(ProductCarItem productcar) {
    _firestore.collection(kcollictionCars).add({
      ksearch: productcar.search,
      knumCar: productcar.numCar,
      kimageUrlcar: productcar.imageUrlsCar,
      ktitle: productcar.title,
      kprice: productcar.price,
      kcolor: productcar.color,
      kgearbox: productcar.gearbox,
      kfuelLiter: productcar.fuelLiter,
      kbrand: productcar.brand,
      kcardoor: productcar.cardoor,
      ktravellingBagSmal: productcar.travellingBagSmal,
      ktravellingBagLarge: productcar.travellingBagLarge,
      kadaptor: productcar.adaptor,
      kjeer: productcar.jeer,
      ktypeFuel: productcar.typeFuel,
      kevaluation: productcar.evaluation,
      kspeedKilo: productcar.speedKilo,
    });
  }

  addUserInfo(UserInformation userInformation) {
    _firestore.collection(kcollictionUser).add({
      knameUser: userInformation.nameUser,
      kpasswordUser: userInformation.passwordUser,
      kemailUser: userInformation.emailUser,
      kimageUrlUser: userInformation.imageUrlUser
    });
  }

  Stream<QuerySnapshot> loadProductCar() {
    return _firestore.collection(kcollictionCars).snapshots();
  }

  Stream<QuerySnapshot> loadUser() {
    return _firestore.collection(kcollictionUser).snapshots();
  }

  Stream<QuerySnapshot> loadorderCar() {
    return _firestore.collection('Orderscar').snapshots();
  }

  Stream<QuerySnapshot> loadOrderDetailscar(documentIdcar) {
    return _firestore
        .collection(kOrderscar)
        .document(documentIdcar)
        .collection(kOrderDetailscar)
        .snapshots();
  }

  deleteProductcar(documentIdcar) {
    _firestore.collection(kcollictionCars).document(documentIdcar).delete();
  }

  deleteProductcarImage(listOfImages, String pId) {
    _firestore
        .collection(kcollictionCars)
        .document(pId)
        .updateData({'urls': FieldValue.arrayRemove(listOfImages)});
  }

  editProductcar(data, documentIdcar) {
    _firestore
        .collection(kcollictionCars)
        .document(documentIdcar)
        .updateData(data);
  }

  storeOrderscar(data, List<Car> productscars) {
    var documentRef = _firestore.collection(kOrderscar).document();
    documentRef.setData(data);
    for (var productcar in productscars) {
      documentRef.collection(kOrderDetailscar).document().setData({
        // ksearch: productcar.search,
        knumCar: productcar.numCar,
        kimageUrlcar: productcar.imageUrlsCar,
        ktitle: productcar.title,
        kprice: productcar.price,
        kcolor: productcar.color,
        kgearbox: productcar.gearbox,
        kfuelLiter: productcar.fuelLiter,
        kbrand: productcar.brand,
        kcardoor: productcar.cardoor,
        ktravellingBagSmal: productcar.travellingBagSmal,
        ktravellingBagLarge: productcar.travellingBagLarge,
        kadaptor: productcar.adaptor,
        kjeer: productcar.jeer,
        ktypeFuel: productcar.typeFuel,
        kevaluation: productcar.evaluation,
        kspeedKilo: productcar.speedKilo,
      });
    }
  }
}
