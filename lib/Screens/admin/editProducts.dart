import 'package:arhb_car_rental/Widgets/cutomeTextField.dart';
import 'package:arhb_car_rental/contants.dart';
import 'package:arhb_car_rental/model/product.dart';
import 'package:arhb_car_rental/services/store.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  static String id = 'EditProduct';

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store = Store();

  String _name, _price, _dictription, _catcory, _imagelocation;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Product products = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Form(
          key: _globalKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              Column(
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
                          _store.ditProduct({
                            kpName: _name,
                            kpCatecoly: _catcory,
                            kpDiscription: _dictription,
                            kpImageLocation: _imagelocation,
                            kpPrice: _price,
                          }, products.pId);
                        }
                      })
                ],
              ),
            ],
          )),
    );
  }
}
