import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sal/Home/SALHomePage.dart';
import 'login/SALLoginPage.dart';
import 'services/SALAuthService.dart';

void main() {
  runApp( ChangeNotifierProvider<SALAuthService>(
    child:MyApp(),
    builder: (BuildContext context) {
          return SALAuthService();
        },
    ),
  );
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
      future: Provider.of<SALAuthService>(context).getUser(),
      builder:(context, AsyncSnapshot<bool> snapshot) {
         if (snapshot.connectionState == ConnectionState.done) {
            return (snapshot.hasData && snapshot.data == true) ? SALHomePage() : SALLoginPage();
          } else {
            return Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                      alignment: Alignment(0.0, 0.0),
                    ),
                  );
          }
      },
    ),
    );

  }
}