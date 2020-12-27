import 'package:arhb_car_rental/Widgets/cutomeTextField.dart';
import 'package:arhb_car_rental/model/product.dart';
import 'package:arhb_car_rental/services/store.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  static String id = 'AddProduct';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _name, _price, _dictription, _catcory, _imagelocation;

  final _store = Store();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            CustomTextfield(
                onclick: (value) {
                  _name = value;
                },
                hinttext: 'إسم الصنف',
                icon: null),
            SizedBox(
              height: 10,
            ),
            CustomTextfield(
                onclick: (value) {
                  _price = value;
                },
                hinttext: ' سعرالصنف',
                icon: null),
            SizedBox(
              height: 10,
            ),
            CustomTextfield(
                onclick: (value) {
                  _dictription = value;
                },
                hinttext: ' وصف الصنف',
                icon: null),
            SizedBox(
              height: 10,
            ),
            CustomTextfield(
                onclick: (value) {
                  _catcory = value;
                },
                hinttext: ' نوع الصنف',
                icon: null),
            SizedBox(
              height: 10,
            ),
            CustomTextfield(
                onclick: (value) {
                  _imagelocation = value;
                },
                hinttext: ' اختيار موقع صوره',
                icon: null),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                child: Text(
                  'اضافه',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (_globalKey.currentState.validate()) {
                    _globalKey.currentState.save();
                    _store.addproduct(Product(
                        pname: _name,
                        pprice: _price,
                        pdicription: _dictription,
                        pcatcory: _catcory,
                        pimagelocation: _imagelocation));
                  }
                })
          ],
        ),
      ),
    );
  }
}
