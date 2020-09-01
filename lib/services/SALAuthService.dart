import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_cognito_plugin/flutter_cognito_plugin.dart';

enum Status { UNINTIALIZED, AUTHENTICATED, AUTHENTICATING, UNAUTHENTICATED }

/// Wrapper around the authentication service
class SALAuthService with ChangeNotifier {
  var _userState;
  var _status = Status.UNINTIALIZED;

  SALAuthService() {
    print("+SEAAuthService()");
  }

  Status get status => _status;

  Future<bool> getUser() async {
    try {
      _userState = await Cognito.initialize();
      if (_userState == UserState.SIGNED_IN) {
        _status = Status.AUTHENTICATED;
        return true;
      }
      return false;
    } catch (e, trace) {
      print(e);
      print(trace);
      _status = Status.UNINTIALIZED;
      return Future.error("Error: Unable to fetch user information");
    }
  }

  Future logout() async {
    Cognito.signOut();
    _status = Status.UNAUTHENTICATED;
  }

  Future<bool> login(
      {@required String username, @required String password}) async {
    _status = Status.AUTHENTICATING;
    try {
      final signInResult = await Cognito.signIn(username, password);
      if (signInResult.signInState == SignInState.DONE) {
        _status = Status.AUTHENTICATED;
        return true;
      } else {
        _status = Status.UNAUTHENTICATED;
        return false;
      }
    } catch (e) {
      _status = Status.UNAUTHENTICATED;
      return Future.error(e.message);
    }
  }

  Future<bool> signUp(
      {String username,
      String password,
      Map<String, String> userAttributes}) async {
    try {
      final signUpResult =
          await Cognito.signUp(username, password, userAttributes);
      // User is confirmed
      if (signUpResult.confirmationState == true) {
        return true;
      }
      _status = Status.AUTHENTICATED;
      return false;
    } catch (e) {
      _status = Status.UNAUTHENTICATED;
      return Future.error(e.message);
    }
  }
}
