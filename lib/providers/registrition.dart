import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:my_tameen/models/user.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Registration extends ChangeNotifier {
  //0 Email
  //1 Facebook
  //2 Google
  static String theMethodRegistered;

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

        await http
            .post("${AllProvider.hostName}/insert-user-social.php", body: {
          "name": profile['name'],
          "email": profile['email'],
        });

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
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount account) async {
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
      await http.post("${AllProvider.hostName}/insert-user-social.php", body: {
        "name": currentUser.displayName,
        "email": currentUser.email,
      });
    });
    _googleSignIn.signInSilently();
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
    hostedDomain: "",
    clientId: "",
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

  List<User> _user = [];
  List<User> get user {
    return _user;
  }

  String userData;
  List<User> loadedUser = [];
  Future<Void> register(String name, String email, String password,
      String phone, BuildContext context, PageController pageController) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await http.post("${AllProvider.hostName}/insert-user.php", body: {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    }).then((respon) {
      userData = respon.body;
      if (userData == "0") {
        isLogin = false;
        showInSnackBar("هذا الحساب موجود مسبقا", context);
      } else if (userData == "1") {
        showInSnackBar("تم التسجيل بنجاح", context);

        loadedUser.add(User(
          name: name,
          email: email,
          password: password,
          phone: phone,
        ));
        prefs.setString('name', name);
        prefs.setString('email', email);
        prefs.setString('password', password);
        prefs.setString('phone', phone);
        userName = name;
        prefs.setString('username', name);
        isLogin = true;
        theMethodRegistered = "3";
        // fetchUserFiles(loadedPatient[0].id).then((s) async {
        //   Navigator.pushReplacement(
        //       context,
        //       PageTransition(
        //           type: PageTransitionType.downToUp, child: MainScreen(1)));
        // });

        _user = loadedUser;
        pageController.jumpToPage(3);
        print(loadedUser[0].name);
        notifyListeners();
      } else {
        showInSnackBar("حدث خطا يرجى المحاولة لاحقا", context);
      }
    });
  }

  List userData2 = [];
  Future<Void> login(String email, String password, BuildContext context,
      PageController pageController) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await http.post("${AllProvider.hostName}/login-user.php", body: {
      "email": email,
      "password": password,
    }).then((respon) {
      userData2 = json.decode(respon.body);

      if (userData2[0] == "wrong") {
        isLogin = false;
        showInSnackBar("يرجى ادخال المعلومات صحيحة", context);
      } else {
        showInSnackBar("تم تسجيل الدخول", context);
        userData2.forEach((item) {
          loadedUser.add(User(
            name: item['name'],
            email: item['email'],
            password: item['password'],
            phone: item['phone'],
          ));
          prefs.setString('name', item['name']);
          prefs.setString('email', item['email']);
          prefs.setString('password', item['password']);
          prefs.setString('phone', item['phone']);
          userName = item['name'];
          prefs.setString('username', item['name']);
        });

        isLogin = true;
        theMethodRegistered = "3";

        _user = loadedUser;
        pageController.jumpToPage(3);
        notifyListeners();
      }
    });
  }

  signOutEmail(PageController pageController, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("password");
    prefs.remove("phone");
    isLogin = false;
    showInSnackBar("تم تسجيل الخروج", context);
    pageController.jumpToPage(3);
  }

  bool once = false;
  checkLogin() async {
    if (once == false) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //prefs.clear();
      if (prefs.containsKey('email') && prefs.containsKey("password")) {
        isLogin = true;
        theMethodRegistered = "3";
        loadedUser = [
          User(
            name: prefs.getString("name"),
            email: prefs.getString("email"),
            password: prefs.getString("password"),
            phone: prefs.getString("phone"),
          )
        ];
        userName = prefs.getString("name");
        _user = loadedUser;
        // fetchUserFiles(loadedPatient[0].id);
        print("he is online");
        once = true;
      }
    }
  }

  void showInSnackBar(String value, BuildContext context) {
    final snackBar = SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    );

// Find the Scaffold in the widget tree and use it to show a SnackBar.

    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
