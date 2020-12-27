import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:flutter/material.dart';

Widget buildCar(Car car, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
    ),
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(
        right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                car.title,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          color: Colors.white,
          height: 120,
          child: Center(
            child: Image.network(
              car.imageUrlsCar[0],
              // car.images[0],
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          car.title,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Pacifico',
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          car.brand,
          style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
        ),
        // Image(
        //     width: ,
        //     color: kPrimaryColor,
        //     height: 50,
        //     fit: BoxFit.fitHeight,
        //     image: AssetImage(
        //       'images/png/icons8-gearbox-64.png',
        //     )),
        Text(
          "per Daily \$ ${car.price}",
          style: TextStyle(
              fontFamily: 'Pacifico',
              fontSize: 14,
              color: Colors.grey[500],
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
