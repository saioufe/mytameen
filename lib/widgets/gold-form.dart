import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:my_tameen/models/goldForm.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:provider/provider.dart';

class GoldForm extends StatefulWidget {
  final PageController c;
  GoldForm(this.c);
  @override
  _GoldFormState createState() => _GoldFormState();
}

class _GoldFormState extends State<GoldForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  List<DropdownMenuItem<dynamic>> listOfModels = [];
  String initialModel = 'دودج';
  String selectedItem = "امريكي";
  void setTheSelectedModel(String selected) {
    setState(() {
      if (selected == "امريكي") {
        selectedItem = "امريكي";
        initialModel = "دودج";
      } else if (selected == "اسيوي") {
        selectedItem = "اسيوي";
        initialModel = "تويوتا";
      } else if (selected == "اوربي") {
        selectedItem = "اوربي";
        initialModel = "اودي";
      } else if (selected == "صيني") {
        selectedItem = "صيني";
      } else if (selected == "رياضي") {
        selectedItem = "رياضي";
      } else if (selected == "وانيت") {
        selectedItem = "وانيت";
      }
    });
  }

  final focusUserName = FocusNode();
  final focusPhone = FocusNode();
  final focusAddres = FocusNode();
  final focusImage = FocusNode();

  @override
  Widget build(BuildContext context) {
    final allOrder = Provider.of<Ordering>(context, listen: false);

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
              'startDate': allOrder.theGoldData != null
                  ? allOrder.theGoldData.startDate
                  : DateTime.now(),
              'carType': allOrder.theGoldData != null
                  ? allOrder.theGoldData.carType
                  : "امريكي",
              // 'CarModel': allOrder.theGoldData != null
              //     ? allOrder.theGoldData.carModel
              //     : initialModel,
              'yearOfManu': allOrder.theGoldData != null
                  ? allOrder.theGoldData.yearOfManu
                  : "2020",
              'price': allOrder.theGoldData != null
                  ? allOrder.theGoldData.price
                  : "",
              'howManyYears': allOrder.theGoldData != null
                  ? allOrder.theGoldData.howManyYears
                  : "1",
            },
            autovalidate: true,
            child: Column(
              children: <Widget>[
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
                  child: FormBuilderDropdown(
                    style: TextStyle(
                        fontSize: 55,
                        color: Theme.of(context).bottomAppBarColor),
                    items: [
                      DropdownMenuItem(
                        child: Container(
                            child: Text(
                          "امريكي",
                          style: TextStyle(fontSize: 20),
                        )),
                        value: "امريكي",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "اسيوي",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "اسيوي",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "اوربي",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "اوربي",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "صيني",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "صيني",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "رياضي",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "رياضي",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "وانيت",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "وانيت",
                      ),
                    ],
                    onChanged: (selected) {
                      setTheSelectedModel(selected);
                    },
                    attribute: "carType",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "موديل السيارة",
                        labelStyle: TextStyle(fontSize: 18)),
                  ),
                ),
                selectedItem == "امريكي"
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
                        child: FormBuilderDropdown(
                          style: TextStyle(
                              fontSize: 55,
                              color: Theme.of(context).bottomAppBarColor),
                          key: UniqueKey(),
                          isDense: true,
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "دودج",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "دودج",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "جي ام سي",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "جي ام سي",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "فورد",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "فورد",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "شيفروليه",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "شيفروليه",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "كرايزلر",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "كرايزلر",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "كاديلاك",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "كاديلاك",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "همر",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "همر",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "جيب",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "جيب",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "تيسلا",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "تيسلا",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "لنكولن",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "لنكولن",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "ميركوري",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "ميركوري",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "سيارات امريكية اخرى",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "سيارات امريكية اخرى",
                            ),
                          ],
                          attribute: "CarModel",
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "هذا الحقل مطلوب")
                          ],
                          decoration: InputDecoration(
                              labelText: "نوع السيارة",
                              labelStyle: TextStyle(fontSize: 18)),
                        ),
                      )
                    : selectedItem == "اسيوي"
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
                            child: FormBuilderDropdown(
                              style: TextStyle(
                                  fontSize: 55,
                                  color: Theme.of(context).bottomAppBarColor),
                              key: UniqueKey(),
                              isDense: true,
                              items: [
                                DropdownMenuItem(
                                  child: Text(
                                    "تويوتا",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "تويوتا",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "لكزس",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "لكزس",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "نيسان",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "نيسان",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "هوندا",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "هوندا",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "اكورا",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "اكورا",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "انفينتي",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "انفينتي",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "ميتسوبيشي",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "ميتسوبيشي",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "سوزوكي",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "سوزوكي",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "سوبارو",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "سوبارو",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "مازدا",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "مازدا",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "ايسوزو",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "ايسوزو",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "هيونداي",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "هيونداي",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "كيا",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "كيا",
                                ),
                                DropdownMenuItem(
                                  child: Text(
                                    "سيارات اسيوية اخرى",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  value: "سيارات اسيوية اخرى",
                                ),
                              ],
                              attribute: "CarModel",
                              validators: [
                                FormBuilderValidators.required(
                                    errorText: "هذا الحقل مطلوب")
                              ],
                              decoration: InputDecoration(
                                  labelText: "نوع السيارة",
                                  labelStyle: TextStyle(fontSize: 18)),
                            ),
                          )
                        : selectedItem == "اوربي"
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
                                child: FormBuilderDropdown(
                                  style: TextStyle(
                                      fontSize: 55,
                                      color:
                                          Theme.of(context).bottomAppBarColor),
                                  key: UniqueKey(),
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(
                                        "اودي",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: "اودي",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "بي ام دبليو",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: "بي ام دبليو",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "مرسيدس",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: "مرسيدس",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "فولكس واجن",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: "فولكس واجن",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "جاكور",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: "جاكور",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "لاندروڤر",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: "لاندروڤر",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "ڤولڤو",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: "ڤولڤو",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "رينو",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: "رينو",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "MG",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: "MG",
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        "سيارات اوربية اخرى",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: "سيارات اوربية اخرى",
                                    ),
                                  ],
                                  attribute: "CarModel",
                                  validators: [
                                    FormBuilderValidators.required(
                                        errorText: "هذا الحقل مطلوب")
                                  ],
                                  decoration: InputDecoration(
                                      labelText: "نوع السيارة",
                                      labelStyle: TextStyle(fontSize: 18)),
                                ),
                              )
                            : Container(
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
                                  attribute: "CarModel",
                                  validators: [
                                    FormBuilderValidators.required(
                                        errorText: "هذا الحقل مطلوب")
                                  ],
                                  decoration: InputDecoration(
                                      labelText: "نوع السيارة",
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
                  child: FormBuilderDropdown(
                    items: [
                      DropdownMenuItem(
                        child: Text("2016"),
                        value: "2016",
                      ),
                      DropdownMenuItem(
                        child: Text("2017"),
                        value: "2017",
                      ),
                      DropdownMenuItem(
                        child: Text("2018"),
                        value: "2018",
                      ),
                      DropdownMenuItem(
                        child: Text("2019"),
                        value: "2019",
                      ),
                      DropdownMenuItem(
                        child: Text("2020"),
                        value: "2020",
                      ),
                      DropdownMenuItem(
                        child: Text("2021"),
                        value: "2021",
                      ),
                      DropdownMenuItem(
                        child: Text("2022"),
                        value: "2022",
                      ),
                      DropdownMenuItem(
                        child: Text("2023"),
                        value: "2023",
                      ),
                      DropdownMenuItem(
                        child: Text("2024"),
                        value: "2024",
                      ),
                    ],
                    attribute: "yearOfManu",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "سنة الصنع",
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
                    // focusNode: focusUserName,
                    // autofocus: false,
                    // textInputAction: TextInputAction.next,
                    // onFieldSubmitted: (v) {
                    //   FocusScope.of(context).requestFocus(focusPhone);
                    // },
                    attribute: "price",
                    decoration: InputDecoration(
                        labelText: "سعر السيارة المراد التامين عليه",
                        labelStyle: TextStyle(fontSize: 18)),
                    validators: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(
                          errorText: "رجاءا ادخل السعر على شكل رقمي"),
                    ],
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
                  child: FormBuilderDropdown(
                    items: [
                      DropdownMenuItem(
                        child: Text("1"),
                        value: "1",
                      ),
                      DropdownMenuItem(
                        child: Text("2"),
                        value: "2",
                      ),
                      DropdownMenuItem(
                        child: Text("3"),
                        value: "3",
                      ),
                    ],
                    attribute: "howManyYears",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "عدد سنوات التامين",
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
                  child: FormBuilderDateTimePicker(
                    attribute: "startDate",
                    inputType: InputType.date,
                    format: DateFormat("yyyy-MM-dd"),
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "تاريخ بداية الوثيقة",
                        labelStyle: TextStyle(fontSize: 18)),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
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
                  child: Text(
                    "البحث",
                    style: TextStyle(
                      fontFamily: 'tajawal',
                      color: Colors.white,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                onPressed: () {
                  //showInSnackBar("يرجى الانتظار", context);

                  if (_fbKey.currentState.saveAndValidate()) {
                    //print( _fbKey.currentState.value);

                    allOrder.theGoldData = GoldFormModel(
                      carType: _fbKey.currentState.value['carType'],
                      carModel: _fbKey.currentState.value['CarModel'],
                      yearOfManu: _fbKey.currentState.value['yearOfManu'],
                      howManyYears: _fbKey.currentState.value['howManyYears'],
                      price: _fbKey.currentState.value['price'],
                      startDate: _fbKey.currentState.value['startDate'],
                    );

                    print(allOrder.theGoldData.carModel);
                    widget.c.jumpToPage(1);
                    //print(allOrder.theGoldData.carModel);
                    // appot
                    //     .appotiment(
                    //         _fbKey.currentState.value['name'],
                    //         _fbKey.currentState.value['phone'],
                    //         _fbKey.currentState.value['date'],

                    //         context)
                    //     .then((value) {
                    //   if (value == 0) {
                    //     showInSnackBar(
                    //         "حدث خطا يرجى المحاولة لاحقا", context);
                    //   } else {
                    //     _fbKey.currentState.reset();
                    //     showInSnackBar("تم تسجيل الموعد", context);
                    //   }
                    // });

                    //print(_fbKey.currentState.value);
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
