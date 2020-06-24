import 'dart:ffi';
import 'dart:io' as Io;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:my_tameen/models/News.dart';
import 'package:my_tameen/models/addons.dart';
import 'package:my_tameen/models/categories.dart';
import 'package:my_tameen/models/companies.dart';
import 'package:my_tameen/models/forOther.dart';
import 'package:my_tameen/models/goldForm.dart';
import 'package:my_tameen/models/lastInfoForm.dart';
import 'package:my_tameen/models/offers.dart';
import 'package:my_tameen/models/orders.dart';
import 'package:my_tameen/models/other.dart';
import 'package:my_tameen/models/promocodes.dart';
import 'package:my_tameen/models/seaForm.dart';
import 'package:my_tameen/models/services.dart';
import 'package:my_tameen/models/slider.dart';
import 'package:my_tameen/models/travelForm.dart';
import 'package:my_tameen/providers/registrition.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Ordering extends ChangeNotifier {
  static const String hostName = "http://cms.mytamen.com";

  GoldFormModel theGoldData;
  SeaFormModel theSeaData;
  TravelFormModel theTravelData;
  ForOtherFormModel theForOtherData;
  Companies selectedCompany;
  LastInfoForm theLastForm;
  List<Addons> selectedAddons;
  double totalPrice;
  double selectedPromo = 0.0;
  bool checkPromoOnce = false;

  String lastName;
  String lastPhone;
  String lastAddres;
  String lastPayment;

  Future<String> uploadGold({
    String carType,
    String carModel,
    String yearOfMan,
    String insurancePrice,
    String price,
    String howManyYears,
    String startDate,
    String selectedCompany,
    List<String> addon1,
    List<String> addons,
    String name,
    String phoneNumber,
    String address,
    List<dynamic> file,
    List<dynamic> file2,
    String payment,
    String promocode,
    String userId,
  }) async {
    String imagesNames;
    String img64;

    String addonNumberOne;
    String theAllAddons;

    var sb = new StringBuffer();
    var sb2 = new StringBuffer();
    var sb3 = new StringBuffer();
    var sb4 = new StringBuffer();

    file.forEach((item) {
      String imageName = item.path.split('/').last;
      sb.write(imageName + "~");
      final bytes = item.readAsBytesSync();
      sb2.write(base64Encode(bytes) + "~");
    });
    file2.forEach((item) {
      String imageName2 = item.path.split('/').last;
      sb.write(imageName2 + "~");
      final bytes2 = item.readAsBytesSync();
      sb2.write(base64Encode(bytes2) + "~");
    });
    imagesNames = sb.toString();
    img64 = sb2.toString();

    addon1.forEach((item) {
      sb3.write(item + "~");
    });
    addonNumberOne = sb3.toString();

    addons.forEach((item) {
      sb4.write(item + "~");
    });
    theAllAddons = sb4.toString();

    await http.post("$hostName/send-new-order-gold.php", body: {
      'carType': carType,
      'carModel': carModel,
      'yearOfMan': yearOfMan,
      'insurancePrice': insurancePrice,
      'price': price,
      'howManyYears': howManyYears,
      'startDate': startDate,
      'selectedCompany': selectedCompany,
      'addon1': addonNumberOne,
      'addons': theAllAddons,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'payment': payment,
      'promocode': promocode,
      "images1": img64,
      "names": imagesNames,
      'userid': userId,
    }).then((respon) {
      print(respon.body);
      lastOrderId = respon.body;
      return respon.body;
    });
  }

  Future<String> uploadSea({
    String seaType,
    String yearOfMan,
    String limitOfResp,
    String price,
    String selectedCompany,
    String name,
    String phoneNumber,
    String address,
    List<dynamic> file,
    List<dynamic> file2,
    String payment,
    String promocode,
    String userId,
  }) async {
    String imagesNames;
    String img64;

    var sb = new StringBuffer();
    var sb2 = new StringBuffer();

    file.forEach((item) {
      String imageName = item.path.split('/').last;
      sb.write(imageName + "~");
      final bytes = item.readAsBytesSync();
      sb2.write(base64Encode(bytes) + "~");
    });
    file2.forEach((item) {
      String imageName2 = item.path.split('/').last;
      sb.write(imageName2 + "~");
      final bytes2 = item.readAsBytesSync();
      sb2.write(base64Encode(bytes2) + "~");
    });
    imagesNames = sb.toString();
    img64 = sb2.toString();

    await http.post("$hostName/send-new-order-sea.php", body: {
      'seaType': seaType,
      'yearOfMan': yearOfMan,
      'limitOfResp': limitOfResp,
      'price': price,
      'selectedCompany': selectedCompany,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'payment': payment,
      'promocode': promocode,
      "images1": img64,
      "names": imagesNames,
      'userid': userId,
    }).then((respon) {
      print(respon.body);
      lastOrderId = respon.body;
      return respon.body;
    });
  }

  Future<String> uploadTravel({
    String travelType,
    String destinition,
    String duration,
    String package,
    String price,
    String selectedCompany,
    String name,
    String phoneNumber,
    String address,
    String payment,
    String promocode,
    String userId,
  }) async {
    await http.post("$hostName/send-new-order-travel.php", body: {
      'travelType': travelType,
      'destinition': destinition,
      'duration': duration,
      'package': package,
      'price': price,
      'selectedCompany': selectedCompany,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'payment': payment,
      'promocode': promocode,
      'userid': userId,
    }).then((respon) {
      print(respon.body);
      lastOrderId = respon.body;
      return respon.body;
    });
  }

  Future<String> uploadForOther({
    String forOtherType,
    String yearOfMan,
    String carModel,
    String howManyYears,
    String price,
    String selectedCompany,
    String name,
    String phoneNumber,
    String address,
    List<dynamic> file,
    List<dynamic> file2,
    List<dynamic> file3,
    List<dynamic> file4,
    String payment,
    String promocode,
    String userId,
  }) async {
    String imagesNames;
    String img64;

    var sb = new StringBuffer();
    var sb2 = new StringBuffer();

    file.forEach((item) {
      String imageName = item.path.split('/').last;
      sb.write(imageName + "~");
      final bytes = item.readAsBytesSync();
      sb2.write(base64Encode(bytes) + "~");
    });
    file2.forEach((item) {
      String imageName2 = item.path.split('/').last;
      sb.write(imageName2 + "~");
      final bytes2 = item.readAsBytesSync();
      sb2.write(base64Encode(bytes2) + "~");
    });
    if (file3 != null) {
      print("not empty");
      file3.forEach((item) {
        String imageName3 = item.path.split('/').last;
        sb.write(imageName3 + "~");
        final bytes3 = item.readAsBytesSync();
        sb2.write(base64Encode(bytes3) + "~");
      });
    } else {
      print("empty");
    }

    if (file4 != null) {
      file4.forEach((item) {
        String imageName4 = item.path.split('/').last;
        sb.write(imageName4 + "~");
        final bytes4 = item.readAsBytesSync();
        sb2.write(base64Encode(bytes4) + "~");
      });
    }
    imagesNames = sb.toString();
    img64 = sb2.toString();
    await http.post("$hostName/send-new-order-forOther.php", body: {
      'forOtherType': forOtherType,
      'yearOfMan': yearOfMan,
      'carModel': carModel,
      'howManyYears': howManyYears,
      'price': price,
      'selectedCompany': selectedCompany,
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'payment': payment,
      'promocode': promocode,
      "images1": img64,
      "names": imagesNames,
      'userid': userId,
    }).then((respon) {
      print(respon.body);
      lastOrderId = respon.body;
      return respon.body;
    });
  }

  String lastOrderId;

  // Future<int> setInitialDataForSearch(GoldFormModel theForm) async {
  //   DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  //   String stringDate = dateFormat.format(theForm.startDate);
  //   await http.post("$hostName/search-companies-flutter.php", body: {
  //     "carType": theForm.carType,
  //     "carModel": theForm.carModel,
  //     "yearOfManu": theForm.yearOfManu,
  //     "price": theForm.price,
  //     "howManyYears": theForm.howManyYears,
  //     "startDate": stringDate,
  //   }).then((respon) {
  //     if (respon.body == "0") {
  //       //showInSnackBar("حدث خطا يرجى المحاولة لاحقا", context);
  //       return 0;
  //     } else {

  //       notifyListeners();
  //       return 1;
  //     }
  //   });
  // }

  List<Companies> _companies = [];
  List<Companies> get companies {
    return _companies;
  }

  List data = [];
  List<dynamic> newsDataOffline;
  Future<void> fetchDataCompanies() async {
    final response = await http.post('$hostName/get-companies-flutter.php');

    data = json.decode(response.body);
    //print(response.body);
    final List<Companies> loadedCompanies = [];
    if (data == null) {
      return;
    }
    newsDataOffline = data;
    data.forEach((newsId) {
      loadedCompanies.add(Companies(
        id: newsId["id"],
        name_arabic: newsId["name_arabic"],
        name_english: newsId["name_english"],
        toc_arabic: newsId["toc_arabic"],
        toc_english: newsId['toc_english'],
        logo: newsId["logo"],
        is_takaful: newsId["is_takaful"],
        is_featured: newsId["is_featured"],
        insurance_type: newsId["insurance_type"],
        american: newsId["american"],
        asian: newsId["asian"],
        euro: newsId["euro"],
        pickup: newsId["pickup"],
        chines: newsId["chines"],
        sport: newsId["sport"],
        small_10: newsId["small_10"],
        small_15: newsId["small_15"],
        small_20: newsId["small_20"],
        medium_10: newsId["medium_10"],
        medium_15: newsId["medium_15"],
        medium_20: newsId["medium_20"],
        large_10: newsId["large_10"],
        large_15: newsId["large_15"],
        large_20: newsId["large_20"],
        not_allow: newsId["not_allow"],
        help_allways: newsId["help_allways"],
        jeep_forOther: newsId["jeep_forOther"],
        salon_forOther: newsId["salon_forOther"],
        other_forOther: newsId["other_forOther"],
        pickup_forOther: newsId["pickup_forOther"],
        boats_100000: newsId["boats_100000"],
        boats_50000: newsId["boats_50000"],
        boats_30000: newsId["boats_30000"],
        boats_10000: newsId["boats_10000"],
        jetski_10000: newsId["jetsky_10000"],
        travel_single_silver: newsId["travel-single-silver"],
        travel_single_gold: newsId["travel-single-gold"],
        travel_single_platinum: newsId["travel-single-platinum"],
        travel_family_silver: newsId["travel-family-silver"],
        travel_family_gold: newsId["travel-family-gold"],
        travel_family_platinum: newsId["travel-family-platinum"],
      ));
    });
    _companies = loadedCompanies;
    notifyListeners();
  }

  List<Promocode> _promocodes = [];
  List<Promocode> get promocodes {
    return _promocodes;
  }

  List data2 = [];
  List<dynamic> newsDataOffline2;
  Future<void> fetchDataPromocodes() async {
    final response = await http.post('$hostName/get-promocodes-flutter.php');

    data2 = json.decode(response.body);
    //print(response.body);
    final List<Promocode> loadedPrmocodes = [];
    if (data2 == null) {
      return;
    }
    newsDataOffline = data2;
    data2.forEach((newsId) {
      List<String> amounts = newsId["amount"].toString().split(",");
      loadedPrmocodes.add(Promocode(
        id: newsId["id"],
        name: newsId["name"],
        range: newsId['promo_range'],
        amount: amounts,
      ));
    });
    _promocodes = loadedPrmocodes;
    notifyListeners();
  }

  List<Orders> _orders = [];
  List<Orders> get orders {
    return _orders;
  }

  List data3 = [];
  List<dynamic> newsDataOffline3;
  Future<void> fetchDataOrders() async {
    final response = await http.post('$hostName/get-orders-flutter.php', body: {
      'userId': Registration.userId.toString(),
    });

    data3 = json.decode(response.body);
    //print(response.body);
    final List<Orders> loadedOrders = [];
    if (data3 == null) {
      return;
    }
    newsDataOffline3 = data3;
    data3.forEach((newsId) {
      loadedOrders.add(Orders(
        id: newsId["id"],
        name: newsId["name"],
        orderType: newsId["insurance_type"],
        price: newsId["price"],
        startDate: newsId["startDate"],
        status: newsId["status"],
      ));
    });
    _orders = loadedOrders;
    notifyListeners();
  }

  List<OtherModel> _others = [];
  List<OtherModel> get others {
    return _others;
  }

  List data4 = [];
  List<dynamic> newsDataOffline4;
  Future<void> fetchDataOthers() async {
    final response = await http.post('$hostName/get-other-flutter.php');

    data4 = json.decode(response.body);
    //print(response.body);
    final List<OtherModel> loadedOthers = [];
    if (data4 == null) {
      return;
    }
    newsDataOffline4 = data4;
    data4.forEach((newsId) {
      loadedOthers.add(OtherModel(
        id: newsId["id"],
        type: newsId["type"],
        desc: newsId["desc"],
      ));
    });
    _others = loadedOthers;
    notifyListeners();
  }
}
