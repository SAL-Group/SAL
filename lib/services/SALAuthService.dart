import 'package:flutter/material.dart';
import 'dart:async';

/// Wrapper around the authentication service
class SALAuthService with ChangeNotifier {

var currentUser;

SALAuthService() {
  print("+SEAAuthService()");
}

Future getUser() async {
    return Future.value(currentUser);
}

 Future logout() async {
   currentUser = null;
   notifyListeners();
  
   return Future.value(currentUser);
 }

 Future login({String email, String password}) async {
   if (password == 'password1224') {
       currentUser = {'email': email };
       notifyListeners();
   } else {
     currentUser = null;
   }
    return Future.value(currentUser);
 }   

 Future createUser({String firstName, 
                    String lastName, 
                    String email,
                     String password })  async { }

}