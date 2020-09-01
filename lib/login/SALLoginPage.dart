import 'package:flutter/material.dart';
import 'package:flutter_cognito_plugin/flutter_cognito_plugin.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:sal/Home/SALHomePage.dart';

import 'package:sal/UI/SALInputTextField.dart';
import 'package:sal/UI/SALPasswordField.dart';
import 'package:sal/UI/SALRoundedButton.dart';
import 'package:sal/constants.dart';
import 'package:sal/login/SEASigupPage.dart';
import 'package:sal/services/SALAuthService.dart';

class SALLoginPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState()  => SALLoginPageState();
}

class SALLoginPageState extends State<SALLoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = new GlobalKey();
  final _key = GlobalKey<ScaffoldState>();

  @override void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 125, height: 270, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 102, 179, 1),
      key: _key,
      body: Form(key: _formKey,
                 child: _body()
            ),
    );
  }

@override
void dispose() {
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
}

Widget _body() {
  return ProgressHUD(
      backgroundColor:  Color.fromRGBO(1, 1, 1, 0),
      child: Builder(
         builder: (context) => Container(
              height: double.infinity,
              child: SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Container(
                height: ScreenUtil.getInstance().setHeight(116),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/3.0x/image8.jpg"),
                  ),
                ),
              ),
            SizedBox(height: 20),
            Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: ScreenUtil.getInstance().setHeight(18)),
              child: Column(
                children: <Widget>[
                  SALInputTextField(
                    hintText: "Username",
                    textEditController: usernameController,
                    textValidator: _validateUserName,                    
                  ),
                  SizedBox(height: 8),
                  SALPasswordField(passwordEditController: passwordController),
                  SizedBox(height: 10),
                  _buildForgotPasswordBtn(),

                  SizedBox(height: 10),              
                  _buildLoginSection(),

                  SizedBox(height: 10),
                  SALRoundedButton(
                    title: "LOGIN",
                    onPressed: () {
                      signIn(context);
                    }
                  ),
          
                  SizedBox(height: 8),
                  SALRoundedButton(
                    title: "SIGN UP",
                    onPressed: () { _goToSignUpPage(context); },
                  ),

                  SizedBox(height: 10),
                  _buildFooterSection(context),
                ]),
            ),
          ],
        ),
      ),
    ),
    ),
    );
}
Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password',
          style: kSmallTextStyle,
        ),
      ),
    );
  }

  Widget _buildLoginSection() => Container(
    width: double.infinity,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         Text(
           "Login with",
            style: kSmallTextStyle
         ),
         SizedBox(height: 10),
         Row(
           mainAxisAlignment:MainAxisAlignment.spaceBetween,
           children: <Widget>[
             InkWell(
                  onTap: () {Cognito.showSignIn(
                                identityProvider: "Google",
                                 scopes: ["email"],
                                );},
                 child: Container(
                 alignment: Alignment.centerRight,
                 height: ScreenUtil.getInstance().setHeight(8),
                 width: ScreenUtil.getInstance().setWidth(40),
                 decoration: BoxDecoration(
                   color: Color(0xFF003e6d),
                   borderRadius: BorderRadius.circular(5.0),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(8, 0, 12, 0),
                   child: Text(
                     'GMAIL',
                      style: kSmallRegularTextStyle,
                   ),
                 ),
               ),
             ),
             InkWell(
                 onTap: () async {
                   final result = await Cognito.showSignIn(
                                identityProvider: "Facebook",
                                 scopes: ["email","openid"],
                                );
                    print(result);
                  //  print(Cognito.getTokens());
                  },
                  child: Container(
                 alignment: Alignment.centerRight,
                 height: ScreenUtil.getInstance().setHeight(8),
                 width: ScreenUtil.getInstance().setWidth(40),
                 decoration: BoxDecoration(
                   color: Color(0xFF003e6d),
                   borderRadius: BorderRadius.circular(5.0),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.fromLTRB(8, 0, 12, 0),
                   child: Text(
                     'Facebook',
                      style: kSmallRegularTextStyle,
                   ),
                 ),
               ),
             ),
         ],
         )
       ],
     ),
  );

Widget _buildFooterSection(BuildContext context) {
  return Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: <Widget>[
            InkWell(
              splashColor: Color(0xFF003e6d),
              onTap:  () => print('SAL Members Button Pressed'),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                       'SAL Members',
                      style: kLargeUnderlineTextStyle,
                  ),
              ),
            ),
            InkWell(
              splashColor: Color(0xFF003e6d),
              onTap:  () => print("Go to home"),
              child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                       'Skip',
                      style: kLargeUnderlineTextStyle,
                  ),
              ),
            ),
      ],
    );
  }

  void _goToSignUpPage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => SALSignUpPage()),
    );
  }

  void _goToHomePage(BuildContext context) {
    Navigator.push( 
      context,
      MaterialPageRoute(builder: (context) => SALHomePage()),
    );
  }

  String _validateUserName(String value) {
    if (value.isEmpty) {
      return "Username is required";
    }
    return null;
  }

  Future<void> signIn(BuildContext context) async {
    final progress = ProgressHUD.of(context);
     if (_formKey.currentState.validate()) {
       progress.show();
       Provider.of<SALAuthService>(context).login(username: usernameController.text, 
                                                  password: passwordController.text)
                                           .then((_) {
                                                progress.dismiss();
                                                _goToHomePage(context);
                                             })
                                           .catchError((error) {
                                                progress.dismiss();
                                                _key.currentState.showSnackBar(SnackBar(content: Text(error.toString()),));
                                           });
     }
  }
}