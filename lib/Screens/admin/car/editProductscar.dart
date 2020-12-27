import 'package:arhb_car_rental/cars/contantnsCars.dart';
import 'package:arhb_car_rental/model/cars/carsItemProduct.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:arhb_car_rental/Widgets/car/cutomeTextFieldcar.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:flutter/material.dart';

class EditProductCar extends StatefulWidget {
  static String id = 'EditProductCar';

  @override
  _EditProductCarState createState() => _EditProductCarState();
}

class _EditProductCarState extends State<EditProductCar> {
  final _globalKeyscaffold = GlobalKey<ScaffoldState>();
  TextEditingController controller1 = TextEditingController();
  String _numCar,
      _search,
      _title,
      _price,
      _color,
      _gearbox,
      _fuelLiter,
      _brand = kHonda,
      _cardoor,
      _travellingBagSmal,
      _travellingBagLarge,
      _adaptor,
      _jeer,
      _typeFuel,
      _evaluation,
      _speedKilo;

  bool loading = false;
  final _store = StoreCar();
  final GlobalKey<FormState> _globalKeyForm = GlobalKey<FormState>();
  bool isUploading = false;
  List<Asset> images = List<Asset>();
  List<String> imageUrls = <String>[];
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: AssetThumb(
              asset: asset,
              width: 70,
              height: 70,
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    ProductCarItem productCarItem = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.black),
        backgroundColor: Colors.grey[900],
        primaryColor: Colors.grey[900],
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: Scaffold(
              key: _globalKeyscaffold,
              resizeToAvoidBottomPadding: true,
              body: ModalProgressHUD(
                inAsyncCall: loading,
                child: Form(
                  key: _globalKeyForm,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                images.length == 0
                                    ? Container(
                                        width: 300,
                                        height: 300,
                                        child: Center(
                                            child: Text(
                                          'صور فارغه ',
                                          style: TextStyle(
                                              fontFamily: 'Pacifico',
                                              color: Colors.grey[400],
                                              fontSize: 50,
                                              fontWeight: FontWeight.bold),
                                        )))
                                    : Container(
                                        width: 300,
                                        height: 300,
                                        child: buildGridView(),
                                      ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(50),
                              child: Center(
                                child: RaisedButton(
                                  onPressed: loadAssets,
                                  child: Center(
                                      child: Text(
                                    "اختيار الصور",
                                    style: TextStyle(
                                        fontFamily: 'Pacifico',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                            DropDownButtonCar(
                                list: <String>[
                                  'Honda',
                                  'Mercedes',
                                  'Audi',
                                  'BMW',
                                  'Toyota',
                                  'Tesla',
                                  'Nissan',
                                  'Ford',
                                  'KIA',
                                  'Great Wall',
                                  'Ferrari',
                                  'Suzuki',
                                  'PROTON',
                                  'Skoda',
                                  'Aston Martin',
                                  'Jaguar',
                                  'Renault',
                                  'SsangYong',
                                  'Foton',
                                  'Opel',
                                  'Bentley',
                                ],
                                title: 'نوع السيارة',
                                val: _brand,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _brand = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DropDownButtonCar(
                                list: <String>[
                                  "أبيض",
                                  "أحمر",
                                  "أسود",
                                  "أزرق",
                                  "بني",
                                  "أخضر",
                                  "رمادي",
                                  "خمري",
                                  "برتقالي",
                                  "زهري",
                                  "بنفسجي",
                                  "فضي",
                                  "تركواز",
                                  "أصفر",
                                  "ذهبي",
                                  "سماوي",
                                  "أزرق غامق / كحلي",
                                  "زيتوني",
                                  "أحمر غامق",
                                  "أخضر غامق / عشبي",
                                  "نحاسي",
                                  "رصاصي",
                                  "لؤلؤي",
                                  "ليموني",
                                  "سكري",
                                ],
                                title: "اللون السيارة",
                                val: _color,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _color = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            DropDownButtonCar(
                                list: <String>[
                                  "4",
                                  "2",
                                  '0',
                                  '1',
                                  '3',
                                  '5',
                                  '8'
                                ],
                                title: " عدد المقاعد",
                                val: _gearbox,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _gearbox = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            DropDownButtonCar(
                                list: <String>["8", "6", "4", "2"],
                                title: " عدد الأبواب",
                                val: _cardoor,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _cardoor = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            DropDownButtonCar(
                                list: <String>[
                                  "ديزل",
                                  "بترول",
                                  "غاز",
                                  "بترول / غاز",
                                  "هايبرد"
                                ],
                                title: "  نوع الوقود",
                                val: _typeFuel,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _typeFuel = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            DropDownButtonCar(
                                list: <String>[
                                  "10",
                                  "20",
                                  "30",
                                  "40",
                                  "50",
                                  "60",
                                  "80",
                                  "100",
                                ],
                                title: "  سعة الوقود بليتر",
                                val: _fuelLiter,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _fuelLiter = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            DropDownButtonCar(
                                list: <String>["لا", 'نعم'],
                                title: "    مكيف شغال؟",
                                val: _adaptor,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _adaptor = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            DropDownButtonCar(
                                list: <String>[
                                  "يدوي / عادي",
                                  "اوتوماتيك",
                                  "جير اوتوماتيك"
                                ],
                                title: "    نوع الجير ",
                                val: _jeer,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _jeer = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            DropDownButtonCar(
                                list: <String>[
                                  "ممتاز",
                                  "جيد جدا",
                                  "جيد",
                                  "معطل"
                                ],
                                title: "    حالة السيارة",
                                val: _evaluation,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _evaluation = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            DropDownButtonCar(
                                list: <String>[
                                  "4",
                                  "2",
                                  '0',
                                  '1',
                                  '3',
                                  '5',
                                  '8'
                                ],
                                title: "    عدد الحقائب صغيرة",
                                val: _travellingBagSmal,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _travellingBagSmal = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            DropDownButtonCar(
                                list: <String>[
                                  "4",
                                  "2",
                                  '0',
                                  '1',
                                  '3',
                                  '5',
                                  '8'
                                ],
                                title: "    عدد الحقائب كبيرة",
                                val: _travellingBagLarge,
                                onclick: (value) {
                                  setState(
                                    () {
                                      _travellingBagLarge = value;
                                    },
                                  );
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextfieldCar(
                              onclick: (value) {
                                _title = value;
                              },
                              hinttext: ' اسم السيارة   -   سنة الصنع',
                              icon: null,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextfieldCar(
                                onclick: (value) {
                                  _numCar = value;
                                },
                                hinttext: '  رقم السيارة',
                                icon: null),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextfieldCar(
                                keyboardType: TextInputType.number,
                                onclick: (value) {
                                  _speedKilo = value + 'كم';
                                },
                                hinttext: '    الكيلو مترات     كم ',
                                icon: null),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextfieldCar(
                                keyboardType: TextInputType.number,
                                onclick: (value) {
                                  _price = value;
                                },
                                hinttext: ' سعر السيارة',
                                icon: null),
                            SizedBox(
                              height: 30,
                            ),
                            RaisedButton(
                                child: Text(
                                  'تعديل',
                                  style: TextStyle(
                                      fontFamily: 'Pacifico',
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  if (_globalKeyForm.currentState.validate() &&
                                      images.length != 0) {
                                    _displaySnackbar(
                                        "Please wait, we are uploading",
                                        false,
                                        15,
                                        true);
                                    uploadImages(productCarItem);
                                  } else {
                                    showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AlertDialog(
                                            backgroundColor: Colors.red[300],
                                            content: Text(
                                                "No image selected Or No fill data",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15)),
                                            actions: <Widget>[
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: Center(
                                                      child: Text(
                                                    "Ok",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  )),
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                  }
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _displaySnackbar(String value, bool pushPage, int i, bool _loading) {
    _globalKeyscaffold.currentState.showSnackBar(SnackBar(
      backgroundColor: pushPage == true ? Color(0xFF7033FF) : Colors.black,
      duration: Duration(seconds: i),
      content: Text('$value'),
    ));
    if (_loading) {
      setState(() {
        loading = _loading;
      });
    }
    if (pushPage) {
      Future.delayed(Duration(seconds: 7)).then((v) {
        Navigator.pop(context);
        setState(() {
          loading = _loading;
        });
      });
    }
  }

  void uploadImages(ProductCarItem productCarItem) {
    for (var imageFile in images) {
      postImage(imageFile).then((downloadUrl) {
        imageUrls.add(downloadUrl.toString());
        if (imageUrls.length == images.length) {
          if (_brand == kHonda) {
            _search = "H";
          } else if (_brand == kMercedes) {
            _search = "M";
          } else if (_brand == kAudi) {
            _search = "A";
          } else if (_brand == kBMW) {
            _search = "B";
          } else if (_brand == kTesla) {
            _search = "T";
          } else if (_brand == kNissan) {
            _search = "N";
          } else if (_brand == kFord) {
            _search = "F";
          } else if (_brand == kKia) {
            _search = "K";
          } else if (_brand == kGreatWall) {
            _search = "G";
          } else if (_brand == kFerrari) {
            _search = "F";
          } else if (_brand == kSuzuki) {
            _search = "S";
          } else if (_brand == kPROTON) {
            _search = "P";
          } else if (_brand == kSkoda) {
            _search = "S";
          } else if (_brand == kAstonMartin) {
            _search = "A";
          } else if (_brand == kJaguar) {
            _search = "K";
          } else if (_brand == kRenault) {
            _search = "R";
          } else if (_brand == kSsangYong) {
            _search = "S";
          } else if (_brand == kFoton) {
            _search = "F";
          } else if (_brand == kOpel) {
            _search = "O";
          } else if (_brand == kBentley) {
            _search = "B";
          }
          _globalKeyForm.currentState.save();
          _store.editProductcar({
            ksearch: _search,
            knumCar: _numCar,
            kimageUrlcar: imageUrls,
            ktitle: _title,
            kprice: _price,
            kcolor: _color,
            kcolor: _color,
            kcolor: _color,
            kcolor: _color,
            kcolor: _color,
            kspeedKilo: _speedKilo,
            kevaluation: _evaluation,
            ktypeFuel: _typeFuel,
            kjeer: _jeer,
            kadaptor: _adaptor,
            ktravellingBagSmal: _travellingBagSmal,
            ktravellingBagLarge: _travellingBagLarge,
            kcardoor: _cardoor,
            kbrand: _brand,
            kfuelLiter: _fuelLiter,
            kgearbox: _gearbox,
          }, productCarItem.pId);

          _displaySnackbar('Uploaded Successfully', true, 5, false);
        }
      }).catchError((err) {
        print(err);
      });
    }
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#8185E2",
          actionBarTitle: "Upload Image",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;
    setState(() {
      images = resultList;
    });
  }

  Future<dynamic> postImage(Asset imageFile) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask =
        reference.putData((await imageFile.getByteData()).buffer.asUint8List());
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }
}
