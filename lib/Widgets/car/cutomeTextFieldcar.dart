import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DropDownButtonCar extends StatefulWidget {
  final List<String> list;
  final String val;
  final String title;

  final Function onclick;
  DropDownButtonCar({
    @required this.list,
    @required this.val,
    @required this.title,
    @required this.onclick,
  });

  @override
  _DropDownButtonCarState createState() => _DropDownButtonCarState();
}

class _DropDownButtonCarState extends State<DropDownButtonCar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new FormField(
        builder: (FormFieldState state) {
          return InputDecorator(
            decoration: InputDecoration(
              fillColor: Colors.white,
              labelText: widget.title,
              filled: true,
              labelStyle: TextStyle(
                fontFamily: 'Pacifico',
                color: Colors.grey[400],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              contentPadding: EdgeInsets.all(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(11.0),
              child: new DropdownButtonHideUnderline(
                child: new DropdownButton(
                  // elevation: 4,
                  value: widget.val,
                  isDense: true,
                  onChanged: widget.onclick,
                  items: widget.list.map((value) {
                    return new DropdownMenuItem(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomTextfieldCar extends StatefulWidget {
  final String hinttext;
  final IconData icon;
  final Function onclick;
  final TextInputType keyboardType;
  final String valutext;
  const CustomTextfieldCar(
      {@required this.onclick,
      @required this.hinttext,
      @required this.icon,
      this.keyboardType,
      this.valutext});

  @override
  _CustomTextfieldCarState createState() => _CustomTextfieldCarState();
}

class _CustomTextfieldCarState extends State<CustomTextfieldCar> {
  @override
  Widget build(BuildContext context) {
    String Messageserror(String hint) {
      switch (hint) {
        case "إدخل إسمك":
          return 'A valid name is required ';
        case "Email":
          return ' A valid email is required ';
        case "Password":
          return '  A password is required  ';
      }
    }

    return TextFormField(
      keyboardType: widget.keyboardType,
      validator: (value) {
        if (value.isEmpty) {
          return Messageserror(widget.hinttext);
        }
      },
      initialValue: widget.valutext,
      onSaved: widget.onclick,
      obscureText: widget.hinttext == "Password" ? true : false,
      cursorColor: Color.fromRGBO(143, 148, 251, 1),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hinttext,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontFamily: 'Pacifico',
        ),
        suffixIcon: Icon(
          widget.icon,
          color: Color.fromRGBO(143, 148, 251, 1),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
