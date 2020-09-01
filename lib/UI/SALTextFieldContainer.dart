import 'package:flutter/material.dart';
import 'package:sal/constants.dart';

class SALTextFieldContainer extends StatelessWidget {
  final Widget child;

  const SALTextFieldContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: kTextFieldColor))),
        child: child);
  }
}
