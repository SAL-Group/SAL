import 'package:flutter/material.dart';
import 'package:sal/constants.dart';
import 'SALTextFieldContainer.dart';

class SALInputTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const SALInputTextField({Key key, this.hintText, this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return SALTextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.white,
        style: kLargeTextStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kLargeTextStyle,
          )
        ),
      );
  }
}


class SALLabeledTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String labelText;

  const SALLabeledTextField({Key key, this.labelText, this.onChanged}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
     return SALTextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: kGreytextColor,
        style: kLabelTextStyle,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: kLabelTextStyle,
          )
        ),
      );
  }
}