import 'package:arhb_car_rental/Screens/loginScreen.dart';
import 'package:arhb_car_rental/splash/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  static String id = "IntroPage";
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: <Widget>[
            makePage(
                page: 1,
                image: 'images/splash/pexels-photo-1402787.jpeg',
                title: ' تطبيق سي آر',
                description:
                    '  من تطبيق سي آر  لتأجير السيارات خدمة توصيل من وإلى  ..مطار عدن ومطار سيئون  ومطار صلاله عمان ومنفذ الوديعة  ومنفذ الغيظه  ...أو من وإلى كل محافظات الجمهورية '),
            makePage(
                page: 2,
                image: 'images/splash/pexels-photo-1231643.png',
                title: ' ألوان سيارات',
                description:
                    'كما توجد مجموعة من السيارات مختارة من ألوان التصميم الخارجي المتعددة ....'),
            makePage(
                page: 3,
                image: 'images/splash/pexels-photo-2922140.jpeg',
                title: 'موديل سيارات  ',
                description:
                    "يوجد قائمة بـ أشهر 10 أنواع سيارات في العالم من ضمنها سيارات تويوتا وسيارات لكزس وسيارات بي ام دبليو وغيرها "),
            makePage(
                page: 4,
                image: 'images/splash/pexels-photo-1051071.jpeg',
                title: 'سائقين',
                description:
                    " لتتمكن من ايجاد مكاتب تأجير سائقين التي تبحث عنها بالمواصفات التي تناسبك.."),
          ],
        ),
      ),
    );
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed(Login.id);
  }

  Widget makePage({image, title, description, page}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.2),
        ])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    FadeAnimation(
                        2,
                        Text(
                          page.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Pacifico',
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                    Text(
                      '/' + totalPage.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Text(
                            title,
                            style: TextStyle(
                                fontFamily: 'Pacifico',
                                color: Colors.white,
                                fontSize: 30,
                                height: 1.2,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                          2,
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              description,
                              style: TextStyle(
                                  fontFamily: 'Pacifico',
                                  color: Colors.white.withOpacity(.7),
                                  height: 1.9,
                                  fontSize: 15),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                        child: Text("تخطي",
                            style: TextStyle(
                                fontFamily: 'Pacifico', color: Colors.white)),
                        onTap: () {
                          navigationPage();
                        }),
                    if (page == 4)
                      GestureDetector(
                          child: Text("تم",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Pacifico',
                              )),
                          onTap: () {
                            navigationPage();
                          }),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
