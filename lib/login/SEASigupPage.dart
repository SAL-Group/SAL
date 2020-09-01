import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sal/UI/SALInputTextField.dart';
import 'package:sal/UI/SALRoundedButton.dart';
import 'package:sal/constants.dart';
import 'package:sal/login/SALLoginPage.dart';
import 'package:sal/services/SALAuthService.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';

class SALSignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SALSignUpPageState();
}

class SALSignUpPageState extends State<SALSignUpPage> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey();
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 125, height: 270, allowFontScaling: true);

    return Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        body: Form(
          key: _formKey,
          child: _body(),
        ));
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();

    super.dispose();
  }

  Widget _body() {
    return ProgressHUD(
      backgroundColor: Color.fromRGBO(1, 1, 1, 0),
      child: Builder(
        builder: (context) => Container(
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
                Text(
                  'Get started',
                  style: kTitleTextStyle,
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: kSmallGreyTextStyle,
                    ),
                    SizedBox(width: 2),
                    InkWell(
                      splashColor: Colors.transparent,
                      onTap: () => {Navigator.pop(context)},
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
                    child: Text(
                      "Sign up with Facebook",
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
                    child: Text(
                      "Sign up with Gmail",
                      style: kSmallRegularTextStyle,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SALLabeledTextField(
                  labelText: "Name*",
                  textEditController: nameController,
                  textValidator: (value) {
                    if (value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  type: SALLabeledTextFieldType.text,
                ),
                SizedBox(height: 10),
                SALLabeledTextField(
                  labelText: "Email*",
                  textEditController: emailController,
                  textValidator: _validateEmail,
                  type: SALLabeledTextFieldType.email,
                ),
                SizedBox(height: 10),
                SALLabeledTextField(
                  labelText: "Username*",
                  textEditController: usernameController,
                  textValidator: (value) {
                    if (value.isEmpty) {
                      return 'Username is required';
                    }
                    return null;
                  },
                  type: SALLabeledTextFieldType.email,
                ),
                SizedBox(height: 10),
                SALLabeledTextField(
                  labelText: "Password*",
                  textEditController: passwordController,
                  textValidator: _validatePassword,
                  type: SALLabeledTextFieldType.password,
                ),
                SizedBox(height: 10),
                SALLabeledTextField(
                  labelText: "Confirm Password*",
                  textEditController: confirmPasswordController,
                  textValidator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter confirm password';
                    }
                    var password = passwordController.text;
                    if (value.compareTo(password) != 0) {
                      return 'Confirm Password is invalid';
                    }

                    return null;
                  },
                  type: SALLabeledTextFieldType.password,
                ),
                SizedBox(height: 10),
                SALLabeledTextField(
                  labelText: "Phone number*",
                  textEditController: phoneNumberController,
                  textValidator: (value) {
                    if (value.isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                  type: SALLabeledTextFieldType.phone,
                ),
                SizedBox(height: 40),
                SALRoundedButton(
                    title: "REGISTER",
                    onPressed: () {
                      signUp(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Password is required";
    } else if (!regExp.hasMatch(value)) {
      return "Password is invalid";
    }
    return null;
  }

  String _validateEmail(String value) {
    Pattern emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(emailPattern);
    if (value.isEmpty) {
      return "Email is required";
    } else if (!regex.hasMatch(value)) {
      return 'Enter Valid Email address';
    }

    return null;
  }

  void _goToSignInPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SALLoginPage()),
    );
  }

  Future<void> signUp(BuildContext context) async {
    final progress = ProgressHUD.of(context);
    if (_formKey.currentState.validate()) {
      progress.show();

      final nameFields = nameController.text.split(' ');
      Map userAttributes = Map<String, String>();
      userAttributes['name'] = nameFields[0] != null ? nameFields[0] : '';
      userAttributes['family_name'] =
          nameFields[1] != null ? nameFields[1] : '';
      userAttributes['email'] = emailController.text;
      userAttributes['phone_number'] = phoneNumberController.text;

      Provider.of<SALAuthService>(context)
          .signUp(
              username: usernameController.text,
              password: passwordController.text,
              userAttributes: userAttributes)
          .then((_) {
        progress.dismiss();
        _goToSignInPage(context);
      }).catchError((error) {
        progress.dismiss();
        _key.currentState.showSnackBar(SnackBar(
          content: Text(error.toString()),
        ));
      });
    }
  }
}
