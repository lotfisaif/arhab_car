import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hinttext;
  final IconData icon;
  final Function onclick;
  final TextInputType type;
  const CustomTextfield(
      {@required this.onclick,
      @required this.hinttext,
      @required this.icon,
      this.type});

  @override
  Widget build(BuildContext context) {
    String Messageserror(String hint) {
      switch (hint) {
        case "Enter Your Name":
          return 'A valid name is required ';
        case "Email":
          return ' A valid email is required ';
        case "Password":
          return '  A password is required  ';
      }
    }

    return TextFormField(
      keyboardType: type,
      validator: (value) {
        if (value.isEmpty) {
          return Messageserror(hinttext);
        }
      },
      onSaved: onclick,
      obscureText: hinttext == "Password" ? true : false,
      cursorColor: Color.fromRGBO(143, 148, 251, 1),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hinttext,
        hintStyle: TextStyle(
            color: Color.fromRGBO(143, 148, 251, 1),
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0),
        suffixIcon: Icon(
          icon,
          color: Color.fromRGBO(143, 148, 251, 1),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
