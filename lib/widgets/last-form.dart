import 'dart:io' as Io;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:my_tameen/models/lastInfoForm.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:my_tameen/providers/registrition.dart';
import 'package:my_tameen/screens/main-screen.dart';
import 'package:provider/provider.dart';

class LastForm extends StatefulWidget {
  // final PageController c;
  // LastForm(this.c);

  @override
  _LastFormState createState() => _LastFormState();
}

class _LastFormState extends State<LastForm> {
  double theStartPrice;
  bool rememberMe = false;
  bool rememberMe2 = false;
  bool rememberMe3 = false;
  double theLastPrice = 0.0;
  double theLastPrice2 = 0.0;
  double theLastPrice3 = 0.0;
  String dropdownValue = "10";
  String dropdownValue2 = 'صغيرة';
  List<String> addon1 = new List<String>();
  List<String> addons = new List<String>();

  bool isLoading = false;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  final focusUserName = FocusNode();
  final focusPhone = FocusNode();
  final focusAddres = FocusNode();
  final focusImage = FocusNode();

  @override
  Widget build(BuildContext context) {
    final allOrders = Provider.of<Ordering>(context, listen: false);
    theStartPrice = allOrders.totalPrice + allOrders.selectedPromo;

    //theLastPrice = double.parse(allOrders.selectedCompany.small_10);
    theLastPrice2 = double.parse(allOrders.selectedCompany.not_allow);
    theLastPrice3 = double.parse(allOrders.selectedCompany.help_allways);
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Container(
          //   margin: EdgeInsets.only(top: 20),
          //   child: Center(
          //     child: Container(
          //       width: 280,
          //       child: Text(
          //         "\"يرجى الحضور في الوقت المحدد او سوف يتم الغاء الموعد \"",
          //         style: TextStyle(
          //           fontWeight: FontWeight.w100,
          //           fontSize: 19,
          //           color: Color(0xff313e4b),
          //         ),
          //         textAlign: TextAlign.center,
          //         //  textDirection: TextDirection.rtl,
          //       ),
          //     ),
          //   ),
          // ),
          FormBuilder(
            key: _fbKey,
            initialValue: {
              'date': DateTime.now(),
              'accept_terms': false,
              'username': allOrders.lastName != null ? allOrders.lastName : "",
              'phone': allOrders.lastPhone != null ? allOrders.lastPhone : "",
              'address':
                  allOrders.lastAddres != null ? allOrders.lastAddres : "",
              'payway':
                  allOrders.lastPayment != null ? allOrders.lastPayment : "",
            },
            autovalidate: true,
            child: Column(
              children: <Widget>[
                Text(
                  "- الخدمات الاضافية -",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).bottomAppBarColor.withOpacity(0.5),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          spreadRadius: 2.0,
                          offset: Offset(0, 2))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "خدمة السيارة البديلة",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Divider(),
                      Container(
                        width: 270,
                        child: Text(
                          "اختر عدد الايام والحجم",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: rememberMe,
                                onChanged: (check) {
                                  setState(() {
                                    rememberMe = check;
                                    if (check) {
                                      if (theLastPrice == 0.0) {
                                        theLastPrice = double.parse(
                                            allOrders.selectedCompany.small_10);
                                      }
                                      allOrders.totalPrice += theLastPrice;
                                    } else {
                                      allOrders.totalPrice -= theLastPrice;
                                    }
                                  });
                                },
                                activeColor: Colors.white,
                                checkColor: Colors.blueAccent,
                              ),
                              Text("اختيار"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              DropdownButton<String>(
                                value: dropdownValue2,
                                icon: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.black54,
                                ),
                                iconSize: 15,
                                style: TextStyle(color: Colors.black),
                                underline: Container(
                                  height: 1,
                                  color: Colors.black54,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue2 = newValue;
                                    if (dropdownValue2 == "صغيرة" &&
                                        dropdownValue == "10") {
                                      if (rememberMe == true) {
                                        allOrders.totalPrice -= theLastPrice;
                                      }
                                      rememberMe = false;
                                      theLastPrice = double.parse(
                                          allOrders.selectedCompany.small_10);
                                    } else if (dropdownValue2 == "صغيرة" &&
                                        dropdownValue == "15") {
                                      if (rememberMe == true) {
                                        allOrders.totalPrice -= theLastPrice;
                                      }
                                      rememberMe = false;
                                      theLastPrice = double.parse(
                                          allOrders.selectedCompany.small_15);
                                    } else if (dropdownValue2 == "صغيرة" &&
                                        dropdownValue == "20") {
                                      if (rememberMe == true) {
                                        allOrders.totalPrice -= theLastPrice;
                                      }
                                      rememberMe = false;
                                      theLastPrice = double.parse(
                                          allOrders.selectedCompany.small_20);
                                    } else if (dropdownValue2 == "متوسطة" &&
                                        dropdownValue == "10") {
                                      if (rememberMe == true) {
                                        allOrders.totalPrice -= theLastPrice;
                                      }
                                      rememberMe = false;
                                      theLastPrice = double.parse(
                                          allOrders.selectedCompany.medium_10);
                                    } else if (dropdownValue2 == "متوسطة" &&
                                        dropdownValue == "15") {
                                      if (rememberMe == true) {
                                        allOrders.totalPrice -= theLastPrice;
                                      }
                                      rememberMe = false;
                                      theLastPrice = double.parse(
                                          allOrders.selectedCompany.medium_15);
                                    } else if (dropdownValue2 == "متوسطة" &&
                                        dropdownValue == "20") {
                                      if (rememberMe == true) {
                                        allOrders.totalPrice -= theLastPrice;
                                      }
                                      rememberMe = false;
                                      theLastPrice = double.parse(
                                          allOrders.selectedCompany.medium_20);
                                    } else if (dropdownValue2 == "كبيرة" &&
                                        dropdownValue == "10") {
                                      if (rememberMe == true) {
                                        allOrders.totalPrice -= theLastPrice;
                                      }
                                      rememberMe = false;
                                      theLastPrice = double.parse(
                                          allOrders.selectedCompany.large_10);
                                    } else if (dropdownValue2 == "كبيرة" &&
                                        dropdownValue == "15") {
                                      if (rememberMe == true) {
                                        allOrders.totalPrice -= theLastPrice;
                                      }
                                      rememberMe = false;
                                      theLastPrice = double.parse(
                                          allOrders.selectedCompany.large_15);
                                    } else if (dropdownValue2 == "كبيرة" &&
                                        dropdownValue == "20") {
                                      if (rememberMe == true) {
                                        allOrders.totalPrice -= theLastPrice;
                                      }
                                      rememberMe = false;
                                      theLastPrice = double.parse(
                                          allOrders.selectedCompany.large_20);
                                    }
                                  });
                                },
                                items: <String>[
                                  "صغيرة",
                                  "متوسطة",
                                  "كبيرة"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: Icon(
                                    Icons.arrow_downward,
                                    color: Colors.black54,
                                  ),
                                  iconSize: 15,
                                  style: TextStyle(color: Colors.black),
                                  underline: Container(
                                    height: 1,
                                    color: Colors.black54,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValue = newValue;
                                      if (dropdownValue2 == "صغيرة" &&
                                          dropdownValue == "10") {
                                        if (rememberMe == true) {
                                          allOrders.totalPrice -= theLastPrice;
                                        }
                                        rememberMe = false;

                                        theLastPrice = double.parse(
                                            allOrders.selectedCompany.small_10);
                                      } else if (dropdownValue2 == "صغيرة" &&
                                          dropdownValue == "15") {
                                        if (rememberMe == true) {
                                          allOrders.totalPrice -= theLastPrice;
                                        }
                                        rememberMe = false;

                                        theLastPrice = double.parse(
                                            allOrders.selectedCompany.small_15);
                                      } else if (dropdownValue2 == "صغيرة" &&
                                          dropdownValue == "20") {
                                        if (rememberMe == true) {
                                          allOrders.totalPrice -= theLastPrice;
                                        }
                                        rememberMe = false;
                                        theLastPrice = double.parse(
                                            allOrders.selectedCompany.small_20);
                                      } else if (dropdownValue2 == "متوسطة" &&
                                          dropdownValue == "10") {
                                        if (rememberMe == true) {
                                          allOrders.totalPrice -= theLastPrice;
                                        }
                                        rememberMe = false;
                                        theLastPrice = double.parse(allOrders
                                            .selectedCompany.medium_10);
                                      } else if (dropdownValue2 == "متوسطة" &&
                                          dropdownValue == "15") {
                                        if (rememberMe == true) {
                                          allOrders.totalPrice -= theLastPrice;
                                        }
                                        rememberMe = false;
                                        theLastPrice = double.parse(allOrders
                                            .selectedCompany.medium_15);
                                      } else if (dropdownValue2 == "متوسطة" &&
                                          dropdownValue == "20") {
                                        if (rememberMe == true) {
                                          allOrders.totalPrice -= theLastPrice;
                                        }
                                        rememberMe = false;
                                        theLastPrice = double.parse(allOrders
                                            .selectedCompany.medium_20);
                                      } else if (dropdownValue2 == "كبيرة" &&
                                          dropdownValue == "10") {
                                        if (rememberMe == true) {
                                          allOrders.totalPrice -= theLastPrice;
                                        }
                                        rememberMe = false;
                                        theLastPrice = double.parse(
                                            allOrders.selectedCompany.large_10);
                                      } else if (dropdownValue2 == "كبيرة" &&
                                          dropdownValue == "15") {
                                        if (rememberMe == true) {
                                          allOrders.totalPrice -= theLastPrice;
                                        }
                                        rememberMe = false;
                                        theLastPrice = double.parse(
                                            allOrders.selectedCompany.large_15);
                                      } else if (dropdownValue2 == "كبيرة" &&
                                          dropdownValue == "20") {
                                        if (rememberMe == true) {
                                          allOrders.totalPrice -= theLastPrice;
                                        }
                                        rememberMe = false;
                                        theLastPrice = double.parse(
                                            allOrders.selectedCompany.large_20);
                                      }
                                    });
                                  },
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("10 يوم"),
                                      value: "10",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("15 يوم"),
                                      value: "15",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("20 يوم"),
                                      value: "20",
                                    ),
                                  ]),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                // Icon(
                                //   Icons.monetization_on,
                                //   color: Colors.white,
                                // ),
                                Text(
                                  "${theLastPrice.toStringAsFixed(2)} KWD",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          spreadRadius: 2.0,
                          offset: Offset(0, 2))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "خدمة عدم حق الرجوع",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Divider(),
                      Container(
                        width: 270,
                        child: Text(
                          "في حالة المخالفات الجسيمة (  القيادة عكس السير - تجاوز الاشارة الضوئية - القيادة فوق السرعة المسموح بها  )",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: rememberMe2,
                                onChanged: (check) {
                                  setState(() {
                                    rememberMe2 = check;
                                    if (check) {
                                      allOrders.totalPrice += theLastPrice2;
                                    } else {
                                      allOrders.totalPrice -= theLastPrice2;
                                    }
                                  });
                                },
                                activeColor: Colors.white,
                                checkColor: Colors.blueAccent,
                              ),
                              Text("اختيار"),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                // Icon(
                                //   Icons.monetization_on,
                                //   color: Colors.white,
                                // ),
                                Text(
                                  "${theLastPrice2.toStringAsFixed(2)} KWD",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width / 1.1,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          spreadRadius: 2.0,
                          offset: Offset(0, 2))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "خدمة المساعدة على الطريق",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Divider(),
                      Container(
                        width: 270,
                        child: Text(
                          "24/7",
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: rememberMe3,
                                onChanged: (check) {
                                  setState(() {
                                    rememberMe3 = check;
                                    if (check) {
                                      allOrders.totalPrice += theLastPrice3;
                                    } else {
                                      allOrders.totalPrice -= theLastPrice3;
                                    }
                                  });
                                },
                                activeColor: Colors.white,
                                checkColor: Colors.blueAccent,
                              ),
                              Text("اختيار"),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                // Icon(
                                //   Icons.monetization_on,
                                //   color: Colors.white,
                                // ),
                                Text(
                                  "${theLastPrice3.toStringAsFixed(2)} KWD",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "- معلومات المستلم -",
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).bottomAppBarColor.withOpacity(0.5),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  //height: 60,
                  width: 380,
                  padding: EdgeInsets.only(right: 30, left: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: FormBuilderTextField(
                    focusNode: focusUserName,
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(focusPhone);
                      allOrders.lastName = v;
                    },
                    attribute: "username",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "الاسم الكامل",
                        labelStyle: TextStyle(fontSize: 18)),
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  //height: 60,
                  width: 380,
                  padding: EdgeInsets.only(right: 30, left: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: FormBuilderPhoneField(
                    focusNode: focusPhone,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(focusAddres);
                      allOrders.lastName = v;
                    },
                    onEditingComplete: () {
                      FocusScope.of(context).requestFocus(focusAddres);
                    },
                    onChanged: (v) {
                      allOrders.lastPhone = v;
                    },
                    countryFilterByIsoCode: ['KW'],
                    defaultSelectedCountryIsoCode: "KW",
                    attribute: "phone",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب"),
                      FormBuilderValidators.numeric(),
                    ],
                    decoration: InputDecoration(
                        labelText: "رقم الهاتف",
                        labelStyle: TextStyle(fontSize: 18)),
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  //height: 60,
                  width: 380,
                  padding: EdgeInsets.only(right: 30, left: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: FormBuilderTextField(
                    focusNode: focusAddres,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(focusImage);
                      allOrders.lastAddres = v;
                    },
                    autofocus: true,
                    attribute: "address",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "عنوان التوصيل",
                        labelStyle: TextStyle(fontSize: 18)),
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  //height: 60,
                  width: 380,
                  padding: EdgeInsets.only(right: 30, left: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "صورة السيارة ( ٤ جهات بالاضافة لرقم الشاصي+ دفتر السيارة او عرض السعر او الشهادة الجمركية ) ",
                        textAlign: TextAlign.right,
                      ),
                      FormBuilderImagePicker(
                        attribute: "carImage",
                        validators: [
                          FormBuilderValidators.required(
                              errorText: "هذا الحقل مطلوب")
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  //height: 60,
                  width: 380,
                  padding: EdgeInsets.only(right: 30, left: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "صورة البطاقة المدنية ( جهتين )",
                        textAlign: TextAlign.right,
                      ),
                      FormBuilderImagePicker(
                        attribute: "idImage",
                        validators: [
                          FormBuilderValidators.required(
                              errorText: "هذا الحقل مطلوب")
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  //height: 60,
                  width: 380,
                  padding: EdgeInsets.only(right: 30, left: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: FormBuilderRadio(
                    options: [
                      FormBuilderFieldOption(
                        value: "دفع عندالتوصيل",
                      ),
                      FormBuilderFieldOption(
                        value: "كي نت / فيزا",
                      )
                    ],
                    attribute: "payway",
                    onChanged: (v) {
                      allOrders.lastPayment = v;
                    },
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "طريقة الدفع",
                        labelStyle: TextStyle(fontSize: 18)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  //height: 60,
                  width: 380,
                  padding: EdgeInsets.only(right: 30, left: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: FormBuilderTextField(
                    attribute: "copone",
                    onChanged: (code) {
                      print(code);
                      if (allOrders.checkPromoOnce == false) {
                        allOrders.promocodes.forEach((element) {
                          if (code == element.name) {
                            int theNum = int.parse(allOrders.theGoldData.price);
                            List<String> ranges = element.range.split("-");
                            print(
                                "the range  ${ranges[0]} : ${ranges[1]}  / the num : $theNum");
                            if (0 <= theNum && theNum <= 5000) {
                              allOrders.selectedPromo =
                                  double.parse(element.amount[0]);

                              allOrders.totalPrice -=
                                  double.parse(element.amount[0]);
                              allOrders.checkPromoOnce = true;

                              print("promocode is RIGHT");
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              Scaffold.of(context).removeCurrentSnackBar();
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text(
                                  "البروموكود صحيح ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                                duration: Duration(seconds: 3),
                              ));
                            } else if ((5001 <= theNum && theNum <= 10000)) {
                              allOrders.selectedPromo =
                                  double.parse(element.amount[1]);

                              allOrders.totalPrice -=
                                  double.parse(element.amount[1]);
                              allOrders.checkPromoOnce = true;

                              print("promocode is RIGHT");
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              Scaffold.of(context).removeCurrentSnackBar();
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text(
                                  "البروموكود صحيح ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                                duration: Duration(seconds: 3),
                              ));
                            } else if ((10001 <= theNum &&
                                theNum <= 100000000000)) {
                              allOrders.selectedPromo =
                                  double.parse(element.amount[2]);

                              allOrders.totalPrice -=
                                  double.parse(element.amount[2]);
                              allOrders.checkPromoOnce = true;

                              print("promocode is RIGHT");
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              Scaffold.of(context).removeCurrentSnackBar();
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text(
                                  "البروموكود صحيح ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                                duration: Duration(seconds: 3),
                              ));
                            } else {
                              print("promocode is RIGHT but price is low");
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              Scaffold.of(context).removeCurrentSnackBar();
                              Scaffold.of(context).showSnackBar(new SnackBar(
                                content: new Text(
                                  "البروموكود صحيح لكن سعر السيارة قليل ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                                duration: Duration(seconds: 3),
                              ));
                            }
                          } else {
                            print("promocode is WRONG ");
                          }
                        });
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "كود الخصم",
                        labelStyle: TextStyle(fontSize: 18)),
                    textAlign: TextAlign.right,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  //height: 60,
                  width: 380,
                  padding: EdgeInsets.only(right: 30, left: 30),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.1),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: FormBuilderCheckbox(
                    attribute: 'accept_terms',
                    label: Text("اوافق على شروط واحكام تطبيق ماي تامين"),
                    validators: [
                      FormBuilderValidators.requiredTrue(
                        errorText: "يجب عليك قبول الشروط والاحكام للموافقة",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            "- السعر النهائي -",
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).bottomAppBarColor.withOpacity(0.5),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "${theStartPrice.toStringAsFixed(2)} KWD",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).bottomAppBarColor),
                  ),
                  Text("السعر"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    allOrders.selectedPromo.toString(),
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).bottomAppBarColor),
                  ),
                  Text(
                    "الخصم",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).bottomAppBarColor),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "${allOrders.totalPrice.toStringAsFixed(2)} KWD",
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).bottomAppBarColor),
                  ),
                  Text(
                    "المجموع",
                    style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).bottomAppBarColor),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                color: Theme.of(context).primaryColor,
                highlightColor: Colors.greenAccent,
                splashColor: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: isLoading == false
                      ? Text(
                          "تاكيد الطلب",
                          style: TextStyle(
                            fontFamily: 'tajawal',
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        )
                      : CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ),
                ),
                onPressed: () {
                  //showInSnackBar("يرجى الانتظار", context);
                  //
                  if (Registration.isLoginGuest == true) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("يرجى التسجيل"),
                          content: Text(
                            "انت الان مشترك كضيف يرجى تسجيل حساب جديد لامكانية عمل طلب للخدمة",
                            textAlign: TextAlign.center,
                          ),
                          elevation: 2,
                          actions: [
                            FlatButton(
                              child: Text("حسنا"),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  MainScreen.routeName, // arguments: news
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    if (_fbKey.currentState.saveAndValidate()) {
                      setState(() {
                        print("true");
                        isLoading = true;
                      });
                      allOrders.theLastForm = LastInfoForm(
                        name: _fbKey.currentState.value['username'],
                        phoneNumber:
                            int.parse(_fbKey.currentState.value['phone']),
                        address: _fbKey.currentState.value['address'],
                        image1: _fbKey.currentState.value['carImage'],
                        image2: _fbKey.currentState.value['idImage'],
                        payment: _fbKey.currentState.value['payway'],
                        promocode: _fbKey.currentState.value['copone'],
                      );
                      //print(allOrders.theLastForm.name);
                      // print(allOrders.theGoldData.carModel);
                      // print( _fbKey.currentState.value['carImage'][0]);

                      List<dynamic> files =
                          _fbKey.currentState.value['carImage'];
                      List<dynamic> files2 =
                          _fbKey.currentState.value['idImage'];

                      if (rememberMe == true) {
                        addon1.add("خدمة السيارة البديلة");

                        addon1.add(dropdownValue2);

                        addon1.add(dropdownValue);
                      }
                      if (rememberMe2 == true) {
                        addons.add("خدمة عدم حق الرجوع");
                      }
                      if (rememberMe3 == true) {
                        addons.add("خدمة المساعدة على الطريق");
                      }
                      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                      String stringDate =
                          dateFormat.format(allOrders.theGoldData.startDate);
                      allOrders
                          .uploadGold(
                        file: files,
                        file2: files2,
                        userId: Registration.userId.toString(),
                        carModel: allOrders.theGoldData.carModel,
                        carType: allOrders.theGoldData.carType,
                        yearOfMan: allOrders.theGoldData.yearOfManu,
                        insurancePrice: allOrders.theGoldData.price,
                        price: allOrders.totalPrice.toString(),
                        howManyYears: allOrders.theGoldData.howManyYears,
                        startDate: stringDate,
                        selectedCompany: allOrders.selectedCompany.name_english,
                        addon1: addon1,
                        addons: addons,
                        name: allOrders.theLastForm.name,
                        phoneNumber:
                            allOrders.theLastForm.phoneNumber.toString(),
                        address: allOrders.theLastForm.address,
                        payment: allOrders.theLastForm.payment,
                        promocode: allOrders.theLastForm.promocode,
                      )
                          .then((value) {
                        setState(() {
                          isLoading = false;
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("تم الطلب بنجاح"),
                              content: Text(
                                "رقم الطلب هو ${allOrders.lastOrderId} يمكنك معرفة اخر الطلبات من الصفحة الشخصية",
                                textAlign: TextAlign.center,
                              ),
                              elevation: 2,
                              actions: [
                                FlatButton(
                                  child: Text("حسنا"),
                                  color: Theme.of(context).primaryColor,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      MainScreen.routeName, // arguments: news
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                        // FocusScope.of(context).requestFocus(new FocusNode());
                        // Scaffold.of(context).removeCurrentSnackBar();
                        // Scaffold.of(context).showSnackBar(new SnackBar(
                        //   action: SnackBarAction(
                        //     label: "ok",
                        //     textColor: Colors.white,
                        //     onPressed: () {
                        //       Navigator.of(context).pushNamed(
                        //         MainScreen.routeName, // arguments: news
                        //       );
                        //     },
                        //   ),
                        //   content: new Text(
                        //     "تم تسجيل الطلب",
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 16.0,
                        //     ),
                        //   ),
                        //   backgroundColor: Colors.blue,
                        //   duration: Duration(seconds: 15),
                        // ));
                      });
                    }
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
