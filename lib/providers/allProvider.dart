import 'dart:ffi';

import 'package:my_tameen/models/News.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AllProvider extends ChangeNotifier {
  static const String hostName = "https://pandoradevs.com";
  static bool buildOnce1 = false;
  static bool buildOnce2 = false;
//   static bool hasLogin;
//   List<Post> _posts = [];
//   List<Post> get posts {
//     return [..._posts];
//   }

//   List data = [];
//   List<dynamic> newsDataOffline;
//   Future<void> fetchData() async {
//     final response = await http.post('$hostName/get-post-flutter.php');

// //print(response.body);
//     data = json.decode(response.body);
//     final List<Post> loadedPosts = [];
//     if (data == null) {
//       return;
//     }
//     newsDataOffline = data;
//     data.forEach((newsId) {
//       loadedPosts.add(Post(
//         id: newsId["id"],
//         title: newsId["title"],
//         text: newsId["text"],
//         date: newsId["date"],
//         postImage: newsId["post-image"],
//         readTime: newsId["read-time"],
//         name: newsId["name"],
//       ));
//     });
//     _posts = loadedPosts;
//     notifyListeners();

//     //_posts = data;
//     // print(response.body);
//   }

//   List<SliderModel> _slider = [];
//   List<SliderModel> get sliders {
//     return [..._slider];
//   }

//   List data2 = [];
//   List<SliderModel> loadedSlider;
//   List<dynamic> newsDataOffline2;
//   Future<void> fetchDataSliders() async {
//     final response = await http.post('$hostName/get-slider-flutter.php');

//     data2 = json.decode(response.body);
//     // print(response.body);
//     final List<SliderModel> loadedSlider = [];
//     if (data2 == null) {
//       return;
//     }
//     newsDataOffline2 = data2;
//     data2.forEach((newsId) {
//       loadedSlider.add(SliderModel(
//         image: newsId['image'],
//         url: newsId['url'],
//       ));
//     });
//     _slider = loadedSlider;
//     notifyListeners();
//   }

//   List<StaffModel> _staff = [];
//   List<StaffModel> get staff {
//     return [..._staff];
//   }

//   List data3 = [];
//   List<StaffModel> loadedStaff;
//   List<dynamic> newsDataOffline3;
//   Future<void> fetchDataStaff() async {
//     final response = await http.post('$hostName/get-staff-flutter.php');

//     data3 = json.decode(response.body);
//     //print(response.body);
//     final List<StaffModel> loadedStaff = [];
//     if (data3 == null) {
//       return;
//     }
//     newsDataOffline3 = data3;
//     data3.forEach((newsId) {
//       loadedStaff.add(StaffModel(
//         id: newsId['id'],
//         image: newsId['image'],
//         name: newsId['name'],
//       ));
//     });
//     _staff = loadedStaff;
//     notifyListeners();
//   }

  List<News> _news = [];
  List<News> get news {
    return [..._news];
  }

  List data = [];
  List<dynamic> newsDataOffline;
  Future<void> fetchDataNews() async {
    final response = await http.post('$hostName/get-post-flutter.php');

    data = json.decode(response.body);
    //print(response.body);
    final List<News> loadedNews = [];
    if (data == null) {
      return;
    }
    newsDataOffline = data;
    data.forEach((newsId) {
      loadedNews.add(News(
        id: newsId["id"],
        title: newsId["title"],
        text: newsId["text"],
        date: newsId["date"],
        postImage: newsId["post-image"],
        readTime: newsId["read-time"],
        name: newsId["name"],
      ));
    });
    _news = loadedNews;
    notifyListeners();
  }

  // List<Patient> _patient = [];
  // List<Patient> get patient {
  //   return [..._patient];
  // }

  // bool once = false;
  // checkLogin() async {
  //   if (once == false) {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     //prefs.clear();
  //     if (prefs.containsKey('username') && prefs.containsKey("password")) {
  //       AllProvider.hasLogin = true;
  //       loadedPatient = [
  //         Patient(
  //           id: prefs.getString("id"),
  //           name: prefs.getString("name"),
  //           description: prefs.getString("description"),
  //           age: prefs.getString("age"),
  //           date: prefs.getString("date"),
  //           file: prefs.getString("file"),
  //           sex: prefs.getString("sex"),
  //           status: prefs.getString("status"),
  //         )
  //       ];
  //       _patient = loadedPatient;
  //       fetchUserFiles(loadedPatient[0].id);
  //       print("he is online");
  //       once = true;
  //     }
  //   }
  // }

  // List userData = [];
  // List<Patient> loadedPatient = [];
  // Future<Void> login(
  //     String username, String password, BuildContext context, String id) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   await http.post("$hostName/login-flutter.php", body: {
  //     "username": username,
  //     "password": password,
  //     "onesignalid": id,
  //   }).then((respon) {
  //     userData = json.decode(respon.body);
  //     if (userData == null) {
  //       hasLogin = false;
  //       print("something went wrong");
  //     } else {
  //       userData.forEach((newsId) {
  //         loadedPatient.add(Patient(
  //           id: newsId['id'],
  //           name: newsId['name'],
  //           age: newsId['age'],
  //           sex: newsId['sex'],
  //           description: newsId['description'],
  //           date: newsId['date'],
  //           status: newsId['status'],
  //           file: newsId['file'],
  //         ));
  //         prefs.setString('id', newsId['id']);
  //         prefs.setString('name', newsId['name']);
  //         prefs.setString('age', newsId['age']);
  //         prefs.setString('sex', newsId['sex']);
  //         prefs.setString('description', newsId['description']);
  //         prefs.setString('date', newsId['date']);
  //         prefs.setString('status', newsId['status']);
  //         prefs.setString('file', newsId['file']);
  //       });
  //       hasLogin = true;

  //       prefs.setString("username", username);
  //       prefs.setString("password", username);
  //       fetchUserFiles(loadedPatient[0].id).then((s) async {
  //         Navigator.pushReplacement(
  //             context,
  //             PageTransition(
  //                 type: PageTransitionType.downToUp, child: MainScreen(1)));
  //       });

  //       _patient = loadedPatient;
  //       print(loadedPatient[0].name);
  //       notifyListeners();
  //     }
  //   });
  // }

  // List<Files> _files = [];
  // List<Files> get files {
  //   return [..._files];
  // }

  // List userfiles = [];
  // List<Files> loadedfiles = [];
  // Future<Void> fetchUserFiles(String userId) async {
  //   await http.post("$hostName/get-files-flutter.php", body: {
  //     "userid": userId,
  //   }).then((respon) {
  //     userfiles = json.decode(respon.body);
  //     if (userfiles == null) {
  //       hasLogin = false;
  //       print("something went wrong");
  //     } else {
  //       userfiles.forEach((newsId) {
  //         loadedfiles.add(Files(
  //             id: newsId['id'],
  //             file: newsId['file'],
  //             fileName: newsId['file-name']));
  //       });
  //       hasLogin = true;

  //       _files = loadedfiles;
  //       print(loadedfiles[0].file);
  //       notifyListeners();
  //     }
  //   });
  // }

  // String filename = "اختر ملف";
  // String filefile;
  // Future<void> setDownloadFile(String name, String file) {
  //   filename = name;
  //   filefile = file;
  //   notifyListeners();
  // }

  Future<bool> checkConnection() async {
    final url = '$hostName/get-posts-flutter.php';
    final response = await http.get(url);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return false;
    }
    return true;
  }
}
