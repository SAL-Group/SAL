import 'package:flutter/material.dart';
import 'package:sal/Models/SALCounselors.dart';

class SALHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState()  => SALSignUpPageState();
}

class SALSignUpPageState extends State<SALHomePage> {
  SALCounselors counselors;


 @override void initState() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen")
      ),
      body: Center(
        child: Text('Home Screen')
      ),
    );
  }
}