import 'package:flutter/material.dart';

class WidgettApp extends StatelessWidget {
  String name;
  bool unactivecolor;
  WidgettApp(this.name, this.unactivecolor);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        height: unactivecolor == true ? 270 : 250,
        width: unactivecolor == true ? 150 : 125,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xffb1d9d1),
              blurRadius: 8.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
          shape: BoxShape.rectangle,
          color: unactivecolor == true ? Color(0xFF7033FF) : Colors.white,
          borderRadius: unactivecolor == true
              ? BorderRadius.circular(10)
              : BorderRadius.circular(100),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: unactivecolor == true ? 0 : 10,
                width: double.infinity,
              ),
              Text(
                this.name,
                style: TextStyle(
                    color: unactivecolor == true
                        ? Colors.white
                        : Color(0xffbfc1cd),
                    fontSize: unactivecolor == true ? 25 : 20,
                    fontWeight: unactivecolor == true ? FontWeight.bold : null),
              ),
              // Image(
              //     image: AssetImage(
              //   'images/cars/Audi.png',
              // )),
            ],
          ),
        ),
      ),
    );
  }
}
