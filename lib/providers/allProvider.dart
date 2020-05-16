import 'dart:ffi';

import 'package:my_tameen/models/News.dart';
import 'package:my_tameen/models/categories.dart';
import 'package:my_tameen/models/offers.dart';
import 'package:my_tameen/models/slider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AllProvider extends ChangeNotifier {
  static const String hostName = "https://mytameen.pandoradevs.com";
  static bool buildOnce1 = false;
  static bool buildOnce2 = false;
  static bool buildOnce3 = false;


  List<Categories> _categories = [];
  List<Categories> get categories {
    return _categories;
  }

  List data2 = [];
  List<dynamic> newsDataOffline2;
  Future<void> fetchDataCategories() async {
    final response = await http.post('$hostName/get-categories-flutter.php');

    data2 = json.decode(response.body);
    //print(response.body);
    final List<Categories> loadedCategories = [];
    if (data2 == null) {
      return;
    }
    newsDataOffline2 = data2;
    data2.forEach((newsId) {
      loadedCategories.add(Categories(
        id: newsId['id'],
        title: newsId['title'],
        text: newsId['text'],
        image: newsId['image'],
      ));
    });
    _categories = loadedCategories;
    notifyListeners();
  }

  Future<String> loadPrivacy(BuildContext context, int langIndex) async {
    if (langIndex == 0) {
      return await DefaultAssetBundle.of(context)
          .loadString('assets/privacyArabic.txt');
    } else {
      return await DefaultAssetBundle.of(context)
          .loadString('assets/privacyEnglish.txt');
    }
  }

  List<News> _news = [];
  List<News> get news {
    return _news;
  }

  List data3 = [];
  List<dynamic> newsDataOffline;
  Future<void> fetchDataNews() async {
    final response = await http.post('$hostName/get-posts-flutter.php');

    data3 = json.decode(response.body);
    //print(response.body);
    final List<News> loadedNews = [];
    if (data3 == null) {
      return;
    }
    newsDataOffline = data3;
    data3.forEach((newsId) {
      loadedNews.add(News(
        id: newsId["id"],
        title: newsId["title"],
        text: newsId["text"],
        date: newsId["date"],
        postImage: newsId["image"],
      ));
    });
    _news = loadedNews;
    notifyListeners();
  }

  List<Offers> _offers = [];
  List<Offers> get offers {
    return _offers;
  }

  List data = [];
  List<dynamic> newsDataOffline3;
  Future<void> fetchDataOffers() async {
    final response = await http.post('$hostName/get-offers-flutter.php');

    data = json.decode(response.body);
    //print(response.body);
    final List<Offers> loadedOffers = [];
    if (data == null) {
      return;
    }
    newsDataOffline3 = data;
    data.forEach((newsId) {
      loadedOffers.add(Offers(
        id: newsId["id"],
        title: newsId["title"],
        text: newsId["text"],
        image: newsId['image'],
        date: newsId['date'],
      ));
    });
    _offers = loadedOffers;
    notifyListeners();
  }

  List<SliderModel> _slider = [];
  List<SliderModel> get sliders {
    return _slider;
  }

  List data4 = [];
  List<SliderModel> loadedSlider;
  List<dynamic> newsDataOffline4;
  Future<void> fetchDataSliders() async {
    final response = await http.post('$hostName/get-sliders-flutter.php');

    data4 = json.decode(response.body);
    // print(response.body);
    final List<SliderModel> loadedSlider = [];
    if (data4 == null) {
      return;
    }
    newsDataOffline4 = data4;
    data4.forEach((newsId) {
      loadedSlider.add(SliderModel(
        image: newsId['image'],
        url: newsId['url'],
      ));
    });
    _slider = loadedSlider;
    notifyListeners();
  }

  // List<Patient> _patient = [];
  // List<Patient> get patient {
  //   return [..._patient];
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
