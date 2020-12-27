import 'package:arhb_car_rental/Screens/user/cars/productInfocar.dart';
import 'package:arhb_car_rental/cars/functioncar.dart';

import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';
import 'package:flutter/material.dart';

Widget ProductsViewcar(
    String carCategory, List<ProductCarItem> allProductscar) {
  List<ProductCarItem> productscar;
  productscar = getProductByCategoryCar(carCategory, allProductscar);
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: .8,
    ),
    itemBuilder: (context, index) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductInfoCar.id,
              arguments: productscar[index]);
        },
        child: Stack(
          children: <Widget>[
            // Positioned.fill(
            //   child: Image(
            //     fit: BoxFit.fill,
            //     image: AssetImage(productscar[index].path),
            //   ),
            // ),
            Positioned(
              bottom: 0,
              child: Opacity(
                opacity: .6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          productscar[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$ ${productscar[index].price}')
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
    itemCount: productscar.length,
  );
}
