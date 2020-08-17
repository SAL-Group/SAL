import 'package:flutter/material.dart';
import 'package:sal/constants.dart';
import 'SALTextFieldContainer.dart';

class SALPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SALPasswordField({Key key, this.onChanged,}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
  
     return SALTextFieldContainer(
      child: TextField(
        obscureText: true,
        style: kLargeTextStyle,
        onChanged: onChanged,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: "Password",
          hintStyle: kLargeTextStyle,
          suffixIcon: Icon(
            Icons.visibility,
            color: kTextFieldColor,
          ),
          )
        ),
      );
  }
}