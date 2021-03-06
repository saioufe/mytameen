import 'dart:io' as Io;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:my_tameen/models/lastInfoForm.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:my_tameen/providers/registrition.dart';
import 'package:my_tameen/screens/main-screen.dart';
import 'package:provider/provider.dart';

class LastFormForOther extends StatefulWidget {
  // final PageController c;
  // LastForm(this.c);

  @override
  _LastFormForOtherState createState() => _LastFormForOtherState();
}

class _LastFormForOtherState extends State<LastFormForOther> {
  double theStartPrice;

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

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
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
                      allOrders.lastPhone = v;
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
                        "صورة الدفتر",
                        textAlign: TextAlign.right,
                      ),
                      FormBuilderImagePicker(
                        attribute: "bookImage",
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
                  child: Column(
                    children: <Widget>[
                      Text(
                        "صورة اعتماد التوقيع والرخصة التجارية ( للشركات فقط )",
                        textAlign: TextAlign.right,
                      ),
                      FormBuilderImagePicker(
                        attribute: "signImage",
                        // validators: [
                        //   FormBuilderValidators.required(
                        //       errorText: "هذا الحقل مطلوب")
                        // ],
                      ),
                    ],
                  ),
                ),
                allOrders.theForOtherData.forOtherType == "تجديد وتحويل"
                    ? Container(
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
                              "صورة البطاقة المدنية للمشتري الجديد",
                              textAlign: TextAlign.right,
                            ),
                            FormBuilderImagePicker(
                              attribute: "newBuyerImage",
                              validators: [
                                FormBuilderValidators.required(
                                    errorText: "هذا الحقل مطلوب")
                              ],
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 1,
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
                    onChanged: (v) {
                      allOrders.lastPayment = v;
                    },
                    attribute: "payway",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "طريقة الدفع",
                        labelStyle: TextStyle(fontSize: 18)),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.only(top: 10),
                //   //height: 60,
                //   width: 380,
                //   padding: EdgeInsets.only(right: 30, left: 30),
                //   decoration: BoxDecoration(
                //     boxShadow: <BoxShadow>[
                //       BoxShadow(
                //           color: Theme.of(context)
                //               .bottomAppBarColor
                //               .withOpacity(0.1),
                //           offset: Offset(1.1, 1.1),
                //           blurRadius: 10.0),
                //     ],
                //     color: Colors.white,
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(5),
                //     ),
                //   ),
                //   child: FormBuilderTextField(
                //     attribute: "copone",
                //     onChanged: (code) {
                //       print(code);
                //       if (allOrders.checkPromoOnce == false) {
                //         allOrders.promocodes.forEach((element) {
                //           if (code == element.name) {
                //             allOrders.selectedPromo = element.amount;

                //             allOrders.totalPrice -= element.amount;
                //             allOrders.checkPromoOnce = true;
                //             print("promocode is RIGHT");
                //             FocusScope.of(context)
                //                 .requestFocus(new FocusNode());
                //             Scaffold.of(context).removeCurrentSnackBar();
                //             Scaffold.of(context).showSnackBar(new SnackBar(
                //               content: new Text(
                //                 "البروموكود صحيح ",
                //                 textAlign: TextAlign.center,
                //                 style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 16.0,
                //                 ),
                //               ),
                //               backgroundColor: Colors.blue,
                //               duration: Duration(seconds: 3),
                //             ));
                //           } else {
                //             print("promocode is WRONG ");
                //           }
                //         });
                //       }
                //     },
                //     decoration: InputDecoration(
                //         labelText: "كود الخصم",
                //         labelStyle: TextStyle(fontSize: 18)),
                //     textAlign: TextAlign.right,
                //   ),
                // ),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: <Widget>[
              //     Text(
              //       allOrders.selectedPromo.toString(),
              //       style: TextStyle(
              //           fontSize: 18,
              //           color: Theme.of(context).bottomAppBarColor),
              //     ),
              //     Text(
              //       "الخصم",
              //       style: TextStyle(
              //           fontSize: 18,
              //           color: Theme.of(context).bottomAppBarColor),
              //     ),
              //   ],
              // ),
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
                onPressed: isLoading == false ?() {
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
                        image1: _fbKey.currentState.value['bookImage'],
                        image2: _fbKey.currentState.value['idImage'],
                        payment: _fbKey.currentState.value['payway'],
                        promocode: "",
                      );

                      List<dynamic> files =
                          _fbKey.currentState.value['bookImage'];
                      List<dynamic> files2 =
                          _fbKey.currentState.value['idImage'];
                      List<dynamic> files3 =
                          _fbKey.currentState.value['signImage'];
                      List<dynamic> files4 =
                          _fbKey.currentState.value['newBuyerImage'];

                      allOrders
                          .uploadForOther(
                        file: files,
                        file2: files2,
                        file3: files3,
                        file4: files4,
                        userId: Registration.userId.toString(),
                        forOtherType: allOrders.theForOtherData.forOtherType,
                        yearOfMan: allOrders.theForOtherData.yearOfManu,
                        carModel: allOrders.theForOtherData.carModel,
                        howManyYears: allOrders.theForOtherData.howManyYears,
                        price: allOrders.totalPrice.toString(),
                        selectedCompany: allOrders.selectedCompany.name_english,
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
                      });
                    }
                  }
                } : null
              ),
            ],
          )
        ],
      ),
    );
  }
}
