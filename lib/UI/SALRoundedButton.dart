import 'package:flutter/material.dart';
import 'package:sal/constants.dart';

class SALRoundedButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  const SALRoundedButton({Key key, this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 44,
        decoration: kButtonDecorationStyle,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: FlatButton(
              color: Colors.white,
              onPressed: onPressed,
              child: Text(
                title,
                style: TextStyle(color: Colors.grey),
              )),
        ));
  }
}
