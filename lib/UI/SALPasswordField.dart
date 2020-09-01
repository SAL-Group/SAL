import 'package:flutter/material.dart';
import 'package:sal/constants.dart';
import 'SALTextFieldContainer.dart';

class SALPasswordField extends StatefulWidget {
  final TextEditingController passwordEditController;

  const SALPasswordField({Key key, this.passwordEditController})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => SALPasswordFieldState();
}

class SALPasswordFieldState extends State<SALPasswordField> {
  var _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return SALTextFieldContainer(
      child: TextFormField(
          controller: widget.passwordEditController,
          validator: validatePassword,
          obscureText: _obscurePassword,
          style: kLargeTextStyle,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: kLargeTextStyle,
            errorStyle: TextStyle(color: Colors.grey),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(0, 0, 0, 0), width: 0.0),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(0, 0, 0, 0), width: 0.0),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              child: Icon(
                _obscurePassword ? Icons.visibility : Icons.visibility_off,
                color: kTextFieldColor,
              ),
            ),
          )),
    );
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (value.length < 8) {
      return "Password should be minimum of 8 characters";
    }
    return null;
  }
}
