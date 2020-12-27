import 'package:arhb_car_rental/cars/CarScreenUi/available_cars.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/constants.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/data.dart';
import 'package:arhb_car_rental/cars/CarScreenUi/instructionCar.dart';
import 'package:flutter/material.dart';

class BookCar extends StatefulWidget {
  final Car car;

  BookCar({@required this.car});

  @override
  _BookCarState createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {
  String selectedMonth = "12 Month";
  bool ma1 = true;
  bool ma2 = false;

  bool ma3 = false;

  int _currentImage = 0;
  int selectedPrice;

  @override
  void initState() {
    super.initState();

    selectedPrice = int.parse(widget.car.price) * 360;
  }

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < widget.car.imageUrlsCar.length; i++) {
      list.add(buildIndicator(i == _currentImage));
    }
    return list;
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
//  _onShare(BuildContext context) async {
//     final RenderBox box = context.findRenderObject();

//     if (imagePaths.isNotEmpty) {
//       await Share.shareFiles(imagePaths,
//           text: text,
//           subject: subject,
//           sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
//     } else {
//       await Share.share(text,
//           subject: subject,
//           sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey[300],
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: Colors.black,
                                  size: 28,
                                )),
                          ),
                          Row(
                            children: [
                              Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.bookmark_border,
                                    color: Colors.white,
                                    size: 22,
                                  )),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey[300],
                                      width: 1,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.black,
                                    size: 22,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        widget.car.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        widget.car.brand,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: PageView(
                          physics: BouncingScrollPhysics(),
                          onPageChanged: (int page) {
                            setState(() {
                              _currentImage = page;
                            });
                          },
                          children: widget.car.imageUrlsCar.map((path) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Image.network(
                                path,
                                fit: BoxFit.scaleDown,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    widget.car.imageUrlsCar.length > 1
                        ? Container(
                            margin: EdgeInsets.symmetric(vertical: 16),
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: buildPageIndicator(),
                            ),
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  ma1 = true;
                                  ma2 = false;
                                  ma3 = false;
                                  selectedPrice =
                                      int.parse(widget.car.price) * 360;
                                  selectedMonth = "12 Month";
                                });
                              },
                              child: buildPricePerPeriod(
                                "12",
                                (int.parse(widget.car.price) * 360).toString(),
                                ma1,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  ma1 = false;
                                  ma2 = true;
                                  ma3 = false;
                                  selectedPrice =
                                      int.parse(widget.car.price) * 180;
                                  selectedMonth = "6 Month";
                                });
                              },
                              child: buildPricePerPeriod(
                                "6",
                                (int.parse(widget.car.price) * 180).toString(),
                                ma2,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  ma1 = false;
                                  ma2 = false;
                                  ma3 = true;
                                  selectedPrice =
                                      int.parse(widget.car.price) * 30;
                                  selectedMonth = "1 Month";
                                });
                              },
                              child: buildPricePerPeriod(
                                "1",
                                (int.parse(widget.car.price) * 30).toString(),
                                ma3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: 16, left: 16, right: 16),
                            child: Text(
                              "SPECIFICATIONS",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            padding: EdgeInsets.only(
                              top: 8,
                              left: 16,
                            ),
                            margin: EdgeInsets.only(bottom: 16),
                            child: ListView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              children: [
                                // buildSpecificationCar(
                                //     "color", widget.car.color),
                                buildSpecificationCar("icons8-gearbox-64.png",
                                    " ناقل حركة  " + widget.car.jeer),
                                buildSpecificationCar("seat.png",
                                    "  مقاعد    " + widget.car.gearbox),
                                buildSpecificationCar("icons8-speed-100.png",
                                    "  السرعة   " + widget.car.speedKilo),
                                buildSpecificationCar(
                                    "icons8-air-conditioner-100.png",
                                    "   مزود بمكيف الهواء  " +
                                        widget.car.adaptor),
                                buildSpecificationCar("icons8-car-door-64.png",
                                    "    أبواب    " + widget.car.cardoor),

                                buildSpecificationCar(
                                    "icons8-glowing-star-96.png",
                                    " حالة    " + widget.car.evaluation),
                                buildSpecificationCar("icons8-petrol-50.png",
                                    "  سعة    " + widget.car.fuelLiter),
                                buildSpecificationCar(
                                    "icons8-gas-station-64.png",
                                    "  نوع وقود    " + widget.car.typeFuel),
                                buildSpecificationCar(
                                    "icons8-briefcase-48.png",
                                    " حقيبة صغيرة    " +
                                        widget.car.travellingBagSmal),
                                buildSpecificationCar(
                                    "icons8-luggage-trolley-30.png",
                                    "حقيبة كبيرة    " +
                                        widget.car.travellingBagLarge),
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selectedMonth,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      "\$ $selectedPrice",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "per month",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InstructionCar(
                        car: widget.car,
                        price: selectedPrice.toString(),
                      ),
                    ));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Book this car",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPricePerPeriod(String months, String price, bool selected) {
    return Container(
      height: 110,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: selected ? kPrimaryColor : Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.grey[300],
          width: selected ? 0 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            months + " Month",
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Text(
            price,
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$",
            style: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: EdgeInsets.only(right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            data,
            style: TextStyle(
              fontFamily: 'Pacifico',
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Image(
              width: 50,
              color: kPrimaryColor,
              height: 50,
              fit: BoxFit.fitHeight,
              image: AssetImage(
                'images/png/$title',
              )),
          SizedBox(
            height: 0,
          ),
        ],
      ),
    );
  }
}
