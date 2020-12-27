import 'package:arhb_car_rental/Providers/modelhud.dart';
import 'package:arhb_car_rental/Screens/loginScreen.dart';
import 'package:arhb_car_rental/Widgets/cutomeTextField.dart';
import 'package:arhb_car_rental/model/cars/userinformtion.dart';
import 'package:arhb_car_rental/services/auth.dart';
import 'package:arhb_car_rental/services/cars/storecars.dart';
import 'package:arhb_car_rental/splash/FadeAnimation.dart';
import 'package:arhb_car_rental/splash/Screen/Login.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  static String id = 'SignupScreen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  List<Asset> images = List<Asset>();
  final _store = StoreCar();

  List<String> imageUrls = <String>[];
  String _email, _password, _name;

  final _auth = Auth();
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 1,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            child: AssetThumb(
              asset: asset,
              width: 20,
              height: 20,
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isloading,
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 210,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'images/splash/undraw_authentication_fsn5.png'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        // Positioned(
                        //   left: 30,
                        //   width: 80,
                        //   height: 200,
                        //   child: FadeAnimation(
                        //       1,
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             image: DecorationImage(
                        //                 image: AssetImage(
                        //                     'images/splash/light-1.png'))),
                        //       )),
                        // ),
                        // Positioned(
                        //   left: 140,
                        //   width: 80,
                        //   height: 150,
                        //   child: FadeAnimation(
                        //       1.3,
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             image: DecorationImage(
                        //                 image: AssetImage(
                        //                     'images/splash/light-2.png'))),
                        //       )),
                        // ),
                        // Positioned(
                        //   right: 40,
                        //   top: 40,
                        //   width: 80,
                        //   height: 150,
                        //   child: FadeAnimation(
                        //       1.5,
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             image: DecorationImage(
                        //                 image: AssetImage(
                        //                     'images/splash/clock.png'))),
                        //       )),
                        // ),
                        Positioned(
                          child: FadeAnimation(
                              1.6,
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Center(
                                  child: Text(
                                    "SignUp",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.8,
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  images.length == 0
                                      ? GestureDetector(
                                          onTap: loadAssets,
                                          child: CircleAvatar(
                                            radius: 55,
                                            backgroundColor: Colors.grey[100],
                                            child: CircleAvatar(
                                              radius: 50,
                                              child: Icon(
                                                Icons.person_add,
                                                color: Colors.grey,
                                              ),
                                              backgroundColor: Colors.grey[100],
                                            ),
                                          ),
                                        )
                                      : Container(
                                          width: 110,
                                          height: 110,
                                          child: GestureDetector(
                                              onTap: () {
                                                imageUrls.clear();
                                                loadAssets();
                                              },
                                              child: buildGridView()),
                                        ),
                                  // CircleAvatar(
                                  //   radius: 55,
                                  //   backgroundColor: Colors.grey[100],
                                  //   child: CircleAvatar(
                                  //     radius: 50,
                                  //     backgroundImage: AssetImage(
                                  //         'images/cars/user_profile.jpg'),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(50),
                                  //   child: Center(
                                  //     child: RaisedButton(
                                  //       onPressed: loadAssets,
                                  //       child: Center(
                                  //           child: Text(
                                  //         "اختيار الصور",
                                  //         style: TextStyle(
                                  //             fontFamily: 'Pacifico',
                                  //             color: Colors.black,
                                  //             fontWeight: FontWeight.bold),
                                  //       )),
                                  //     ),
                                  //   ),
                                  // ),
                                  Divider(),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: CustomTextfield(
                                      onclick: (value) {
                                        _name = value;
                                      },
                                      hinttext: "Enter Your Name",
                                      icon: Icons.perm_identity,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: CustomTextfield(
                                      onclick: (value) {
                                        _email = value;
                                      },
                                      hinttext: "Email",
                                      icon: Icons.email,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: CustomTextfield(
                                      onclick: (value) {
                                        _password = value;
                                      },
                                      hinttext: "Password",
                                      icon: Icons.lock,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                          2,
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                              child: Builder(
                                builder: (context) => FlatButton(
                                  onPressed: () async {
                                    final modelhud = Provider.of<ModalHud>(
                                        context,
                                        listen: false);
                                    modelhud.changeisloading(true);

                                    try {
                                      if (_globalKey.currentState.validate()) {
                                        _globalKey.currentState.save();
                                        try {
                                          final authResult = await _auth.signUp(
                                              _email, _password);
                                          for (var imageFile in images) {
                                            postImage(imageFile)
                                                .then((downloadUrl) {
                                              imageUrls
                                                  .add(downloadUrl.toString());

                                              _store.addUserInfo(
                                                UserInformation(
                                                    nameUser: _name,
                                                    emailUser: _email,
                                                    passwordUser: _password,
                                                    imageUrlUser: imageUrls),
                                              );
                                            }).catchError((err) {
                                              print(err);
                                            });
                                          }
                                          modelhud.changeisloading(false);
                                          Navigator.of(context)
                                              .pushReplacementNamed(Login.id);
                                        } on PlatformException catch (e) {
                                          modelhud.changeisloading(false);
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(e.message),
                                            backgroundColor: Colors.redAccent,
                                          ));
                                        }
                                        modelhud.changeisloading(false);
                                      }
                                      modelhud.changeisloading(false);
                                    } catch (e) {
                                      Scaffold.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(e.message),
                                        backgroundColor: Colors.redAccent,
                                      ));
                                    }
                                  },
                                  child: Text(
                                    'SignUp',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        FadeAnimation(
                          1.5,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Your have an account ? ',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 18,
                                  letterSpacing: 3.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed(Login.id);
                                },
                                child: Text(
                                  "Login ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 3.0,
                                      fontSize: 20,
                                      color: Color.fromRGBO(143, 148, 251, 1)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
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
