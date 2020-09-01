import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sal/Models/SALCounselors.dart';
import 'package:sal/login/SALLoginPage.dart';
import 'package:sal/services/SALAuthService.dart';

class SALHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SALSignUpPageState();
}

class SALSignUpPageState extends State<SALHomePage> {
  SALCounselors counselors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Provider.of<SALAuthService>(context).logout();
            _goToSignInPage(context);
          },
        ),
      ),
      body: Center(child: Text('Home Screen')),
    );
  }

  void _goToSignInPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SALLoginPage()),
    );
  }
}
