import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sal/UI/SALInputTextField.dart';
import 'package:sal/UI/SALRoundedButton.dart';
import 'package:sal/constants.dart';

class SALSignUpPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState()  => SALSignUpPageState();
}

class SALSignUpPageState extends State<SALSignUpPage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 125, height: 270, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body:  Container(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.getInstance().setHeight(15),
                    vertical: 120.0,
                  ),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Get started',
            style: kTitleTextStyle,
            ),
            SizedBox(height: 5),
             Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 Text('Already have an account?',
                  style: kSmallGreyTextStyle,
                 ),
                 SizedBox(width:2),
                 InkWell(
                   splashColor: Colors.transparent,
                   onTap:  () => {Navigator.pop(context) },
                   child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                       'Login',
                        style: kSmallGreyBoldTextStyle,
                      ),
                  ),
                ),
               ],
             ),
             SizedBox(height: 10),
             SizedBox(
              width: double.infinity,
             child: FlatButton(
                  onPressed: () {},
                  color: Color(0xFF4066ad),
                  child: Text("Sign up with Facebook",
                       style: kSmallRegularTextStyle,
                       ),
              ),
             ),
             SizedBox(height: 10),
             SizedBox(
              width: double.infinity,
              child: FlatButton(
                  onPressed: () {},
                  color: Color(0xFFcf4431),
                  child: Text("Sign up with Gmail",
                          style: kSmallRegularTextStyle,
                      ),
                ),
             ),

             SizedBox(height: 10),
             SALLabeledTextField(
                    labelText: "Name*",
                    onChanged: (value) {},
                  ),

             SizedBox(height: 10),
             SALLabeledTextField(
                    labelText: "Email*",
                    onChanged: (value) {},
                  ),

             SizedBox(height: 10),
             SALLabeledTextField(
                    labelText: "Password*",
                    onChanged: (value) {},
                  ),
             SizedBox(height: 10),
             SALLabeledTextField(
                    labelText: "Confirm Password*",
                    onChanged: (value) {},
                  ),
              SizedBox(height: 10),
              SALLabeledTextField(
                    labelText: "Phone number",
                    onChanged: (value) {},
              ),
                SizedBox(height: 40),
                  SALRoundedButton(
                    title: "REGISTER",
                    onPressed: () { print("Register called"); },
                  ),

          ],
        ),
    ),
    ),
    );
  }
}