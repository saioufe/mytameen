import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Registration extends ChangeNotifier {
  //0 Email
  //1 Facebook
  //2 Google
  static String theMethodRegistered = " 0 ";

  static bool isLogin = false;
  static String userName;
  GoogleSignInAccount currentUser;
  String _contactText;

  static final FacebookLogin facebookSignIn = new FacebookLogin();

  String _message = 'Log in/out by pressing the buttons below.';

  Future<Null> loginFacebook() async {
    final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final FacebookAccessToken accessToken = result.accessToken;
        final graphResponse = await http.post(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${accessToken.token}');
        final profile = jsonDecode(graphResponse.body);
        print(profile);
        isLogin = true;

        theMethodRegistered = "1";
        print(theMethodRegistered);
        userName = profile['name'];
        _showMessage('''
         Logged in!      
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
        break;
      case FacebookLoginStatus.cancelledByUser:
        _showMessage('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        _showMessage('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.errorMessage}');
        break;
    }
  }

  Future<Null> logOutFaceBook() async {
    await facebookSignIn.logOut();
    _showMessage('Logged out.');
  }

  void _showMessage(String message) {
    //setState(() {
    _message = message;
    print(_message);
    //});
  }

  void googleFirstMove() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      currentUser = account;

      if (currentUser != null) {
        handleGetContact();
        isLogin = true;
        userName = currentUser.displayName;
        theMethodRegistered = "2";
        print(theMethodRegistered);
        //Text(_currentUser.email)
        notifyListeners();
      }
    });
    _googleSignIn.signInSilently();
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future<void> handleGetContact() async {
    // setState(() {
    //   _contactText = "Loading contact info...";
    // });
    final http.Response response = await http.get(
      'https://people.googleapis.com/v1/people/me/connections'
      '?requestMask.includeField=person.names',
      headers: await currentUser.authHeaders,
    );
    if (response.statusCode != 200) {
      // setState(() {
      _contactText = "People API gave a ${response.statusCode} "
          "response. Check logs for details.";
      // });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    final String namedContact = pickFirstNamedContact(data);
    // setState(() {
    if (namedContact != null) {
      _contactText = "I see you know $namedContact!";
      print(namedContact);
    } else {
      _contactText = "No contacts to display.";
    }
    // });
  }

  String pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic> connections = data['connections'];
    final Map<String, dynamic> contact = connections?.firstWhere(
      (dynamic contact) => contact['names'] != null,
      orElse: () => null,
    );
    if (contact != null) {
      final Map<String, dynamic> name = contact['names'].firstWhere(
        (dynamic name) => name['displayName'] != null,
        orElse: () => null,
      );
      if (name != null) {
        return name['displayName'];
      }
    }
    return null;
  }

  Future<void> handleSignInGoogle() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleSignOut() => _googleSignIn.disconnect();
}
