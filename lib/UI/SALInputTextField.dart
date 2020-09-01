//import 'dart:html';

//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sal/constants.dart';
import 'SALTextFieldContainer.dart';

class SALInputTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditController;
  final FormFieldValidator<String> textValidator;

  const SALInputTextField(
      {Key key, this.hintText, this.textEditController, this.textValidator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SALTextFieldContainer(
      child: TextFormField(
          controller: textEditController,
          validator: textValidator,
          cursorColor: Colors.white,
          style: kLargeTextStyle,
          decoration: InputDecoration(
            hintText: hintText,
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
          )),
    );
  }
}

// Possible type of text fields
enum SALLabeledTextFieldType { phone, email, password, text }

class SALLabeledTextField extends StatelessWidget {
  final TextEditingController textEditController;
  final FormFieldValidator<String> textValidator;
  final String labelText;
  final SALLabeledTextFieldType type;

  const SALLabeledTextField(
      {Key key,
      this.labelText,
      this.textEditController,
      this.textValidator,
      this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextInputType inputType = TextInputType.text;
    var bObscureText = false;
    switch (type) {
      case SALLabeledTextFieldType.phone:
        {
          inputType = TextInputType.phone;
        }
        break;
      case SALLabeledTextFieldType.email:
        {
          inputType = TextInputType.emailAddress;
        }
        break;
      case SALLabeledTextFieldType.password:
        {
          bObscureText = true;
          inputType = TextInputType.text;
        }
        break;
      case SALLabeledTextFieldType.text:
      default:
        {
          inputType = TextInputType.text;
        }
    }
    return SALTextFieldContainer(
      child: TextFormField(
          controller: textEditController,
          validator: textValidator,
          cursorColor: kGreytextColor,
          style: kLabelTextStyle,
          keyboardType: inputType,
          obscureText: bObscureText,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: kLabelTextStyle,
          )),
    );
  }
}
