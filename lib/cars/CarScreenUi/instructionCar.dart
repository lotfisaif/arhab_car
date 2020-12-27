import 'package:arhb_car_rental/Providers/modelhud.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/available_cars.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/bbokdirection.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/constants.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/map.dart';
import 'package:arhb_car_rental/services/auth.dart';
import 'package:arhb_car_rental/splash/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class InstructionCar extends StatefulWidget {
  final Car car;
  final String price;

  InstructionCar({@required this.car, @required this.price});
  static String id = "InstructionCar";
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  _InstructionCarState createState() => _InstructionCarState();
}

class _InstructionCarState extends State<InstructionCar> {
  bool keepMeLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModalHud>(context).isloading,
          child: SingleChildScrollView(
            child: Form(
              key: widget.globalKey,
              child: Container(
                child: Column(
                  children: <Widget>[
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
                                    Text(
                                      " الشروط والمستندات المطلوبة عند تأجير سيارات في اليمن :",
                                      style: TextStyle(
                                        backgroundColor: Colors.grey[300],
                                        fontSize: 20,
                                        fontFamily: 'Pacifico',
                                        color: kPrimaryColor,
                                      ),
                                      // textAlign: TextAlign.left,
                                      textDirection: TextDirection.rtl,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        ": الرخصة الدولية للقيادة  ",
                                        style: TextStyle(
                                          backgroundColor: Colors.amber,
                                          fontSize: 17,
                                          fontFamily: 'Pacifico',
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.end,
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        " من الشروط الأساسية لإيجار سيارة خاصة في اليمن توفّر الرخصة الدولية لديك  وإذا لم تتوفر هذه الوثيقة  فلن تتمكن من تاجير سيارات في اليمن بشكل قانوني وإذا قامت الشركة بتسليمك السيارة، من الممكن أن تقع في ورطة مع الشرطة ملاحظة: في حال عدم توفر الرخصة الدولية يمكنك تاجير سيارات باليمن مع سائق ولكن إن كنت تريد الحصول على رخصة دولية، الأمر لا يستغرق منك سوى يوم واحد أو أقل، ومبلغ أقل من 100 دولار",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Pacifico',
                                            color: Colors.black38,
                                            wordSpacing: 4.0,
                                            textBaseline:
                                                TextBaseline.ideographic),
                                        textAlign: TextAlign.end,
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        ":    البطاقة الائتمانية  ",
                                        style: TextStyle(
                                          backgroundColor: Colors.amber,
                                          fontSize: 17,
                                          fontFamily: 'Pacifico',
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.end,
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        "أنت بحاجة لبطاقة ائتمانية بنكية صالحة لتستخدمها في دفع تكلفة الإيجار ولا تقلق في أغلب الأوقات لن يتم خصم مبلغ الإيجار إلا بعد تسليم السيارة  كما أنه يوجد العديد من الشركات تتيح حجز و تاجير سيارات اليمن بدون بطاقة ائتمانية، وتقدم خيار الدفع نقدا",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Pacifico',
                                            color: Colors.black38,
                                            wordSpacing: 4.0,
                                            textBaseline:
                                                TextBaseline.ideographic),
                                        textAlign: TextAlign.end,
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        ":     يجب أن يكون عمر السائق بين 30 لـ 65 عام  ",
                                        style: TextStyle(
                                          backgroundColor: Colors.amber,
                                          fontSize: 17,
                                          fontFamily: 'Pacifico',
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.end,
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Text(
                                        "يمكن أن تطلب بعض شركات تاجير سيارات في تركيا مبلغ مالي إضافي إذا كان عمرك أقل من 30 أو أكثر من 65، لذا عليك مراجعة شروط وأحكام السيارة  لأن الأمر يختلف حسب نوع السيارة وفئة الرخصة التي بحوزتك",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Pacifico',
                                            color: Colors.black38,
                                            wordSpacing: 4.0,
                                            textBaseline:
                                                TextBaseline.ideographic),
                                        textAlign: TextAlign.end,
                                        textDirection: TextDirection.ltr,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              '  رجوع  ',
                                              style: TextStyle(
                                                  fontFamily: 'Pacifico',
                                                  color: Colors.grey[400]),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 100,
                                          ),
                                          Text(
                                            'أوافق القوانين والشروط  ',
                                            style: TextStyle(
                                                fontFamily: 'Pacifico',
                                                color: Colors.grey[400]),
                                          ),
                                          Theme(
                                            data: ThemeData(
                                                unselectedWidgetColor:
                                                    Color.fromRGBO(
                                                        143, 148, 251, 1)),
                                            child: Checkbox(
                                              checkColor: Color.fromRGBO(
                                                  143, 148, 251, 1),
                                              activeColor: Colors.grey[100],
                                              value: keepMeLoggedIn,
                                              onChanged: (value) {
                                                setState(() {
                                                  keepMeLoggedIn = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          keepMeLoggedIn == true
                              ? FadeAnimation(
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
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyAppMap(
                                                    car: widget.car,
                                                    price: widget.price,
                                                  ),
                                                ));
                                          },
                                          child: Text(
                                            'Next',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                letterSpacing: 3),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Text(""),
                          SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
