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
  String selectedItem = "امريكي";
  void setTheSelectedModel(String selected) {
    setState(() {
      if (selected == "امريكي") {
        selectedItem = "امريكي";
      } else if (selected == "اسيوي") {
        selectedItem = "اسيوي";
      } else if (selected == "اوربي") {
        selectedItem = "اوربي";
      } else if (selected == "صيني") {
        selectedItem = "صيني";
      } else if (selected == "رياضي") {
        selectedItem = "رياضي";
      } else if (selected == "وانيت") {
        selectedItem = "وانيت";
      } 
    });
  }

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
              'startdate': DateTime.now(),
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
                    items: [
                      DropdownMenuItem(
                        child: Text("امريكي"),
                        value: "امريكي",
                      ),
                      DropdownMenuItem(
                        child: Text("اسيوي"),
                        value: "اسيوي",
                      ),
                      DropdownMenuItem(
                        child: Text("اوربي"),
                        value: "اوربي",
                      ),
                      DropdownMenuItem(
                        child: Text("صيني"),
                        value: "صيني",
                      ),
                      DropdownMenuItem(
                        child: Text("رياضي"),
                        value: "رياضي",
                      ),
                      DropdownMenuItem(
                        child: Text("وانيت"),
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
                          key: UniqueKey(),
                          allowClear: true,
                          items: [
                            DropdownMenuItem(
                              child: Text("دوج"),
                              value: "دوج",
                            ),
                            DropdownMenuItem(
                              child: Text("جي ام سي"),
                              value: "جي ام سي",
                            ),
                            DropdownMenuItem(
                              child: Text("فورد"),
                              value: "فورد",
                            ),
                            DropdownMenuItem(
                              child: Text("شيفروليه"),
                              value: "شيفروليه",
                            ),
                            DropdownMenuItem(
                              child: Text("كرايزلر"),
                              value: "كرايزلر",
                            ),
                            DropdownMenuItem(
                              child: Text("كاديلاك"),
                              value: "كاديلاك",
                            ),
                            DropdownMenuItem(
                              child: Text("همر"),
                              value: "همر",
                            ),
                            DropdownMenuItem(
                              child: Text("جيب"),
                              value: "جيب",
                            ),
                            DropdownMenuItem(
                              child: Text("تيسلا"),
                              value: "تيسلا",
                            ),
                            DropdownMenuItem(
                              child: Text("لنكولن"),
                              value: "لنكولن",
                            ),
                            DropdownMenuItem(
                              child: Text("ميركوري"),
                              value: "ميركوري",
                            ),
                            DropdownMenuItem(
                              child: Text("سيارات امريكية اخرى"),
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
                              key: UniqueKey(),
                              allowClear: true,
                              items: [
                                DropdownMenuItem(
                                  child: Text("تويوتا"),
                                  value: "تويوتا",
                                ),
                                DropdownMenuItem(
                                  child: Text("لكزس"),
                                  value: "لكزس",
                                ),
                                DropdownMenuItem(
                                  child: Text("نيسان"),
                                  value: "نيسان",
                                ),
                                DropdownMenuItem(
                                  child: Text("هوندا"),
                                  value: "هوندا",
                                ),
                                DropdownMenuItem(
                                  child: Text("اكورا"),
                                  value: "اكورا",
                                ),
                                DropdownMenuItem(
                                  child: Text("انفينتي"),
                                  value: "انفينتي",
                                ),
                                DropdownMenuItem(
                                  child: Text("ميتسوبيشي"),
                                  value: "ميتسوبيشي",
                                ),
                                DropdownMenuItem(
                                  child: Text("سوزوكي"),
                                  value: "سوزوكي",
                                ),
                                DropdownMenuItem(
                                  child: Text("سوبارو"),
                                  value: "سوبارو",
                                ),
                                DropdownMenuItem(
                                  child: Text("مازدا"),
                                  value: "مازدا",
                                ),
                                DropdownMenuItem(
                                  child: Text("ايسوزو"),
                                  value: "ايسوزو",
                                ),
                                DropdownMenuItem(
                                  child: Text("هيونداي"),
                                  value: "هيونداي",
                                ),
                                DropdownMenuItem(
                                  child: Text("كيا"),
                                  value: "كيا",
                                ),
                                DropdownMenuItem(
                                  child: Text("سيارات اسيوية اخرى"),
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
                                  key: UniqueKey(),
                                  allowClear: true,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text("اودي"),
                                      value: "اودي",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("بي ام دبليو"),
                                      value: "بي ام دبليو",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("مرسيدس"),
                                      value: "مرسيدس",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("فولكس واجن"),
                                      value: "فولكس واجن",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("جاكور"),
                                      value: "جاكور",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("لاندروڤر"),
                                      value: "لاندروڤر",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("ڤولڤو"),
                                      value: "ڤولڤو",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("رينو"),
                                      value: "رينو",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("MG"),
                                      value: "MG",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("سيارات اوربية اخرى"),
                                      value: "سيارات اوربية اخرى",
                                    ),
                                  ],
                                  attribute: "CarModel",
                                  validators: [
                                    FormBuilderValidators.required(
                                        errorText: "هذا الحقل مطلوب")
                                  ],
                                  decoration: InputDecoration(
                                      labelText: "توع السيارة",
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
                                      labelText: "توع السيارة",
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
