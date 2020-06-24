import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:my_tameen/models/forOther.dart';
import 'package:my_tameen/models/goldForm.dart';
import 'package:my_tameen/models/seaForm.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:provider/provider.dart';

class ForOtherForm extends StatefulWidget {
  final PageController c;
  ForOtherForm(this.c);
  @override
  _ForOtherFormState createState() => _ForOtherFormState();
}

class _ForOtherFormState extends State<ForOtherForm> {
  String selectedItem = "two";
  void setHowManyYears(String selected) {
    int numSelected = int.parse(selected);
    setState(() {
      if (numSelected <= 2016) {
        selectedItem = "one";
      } else {
        selectedItem = "two";
      }
    });
  }

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final allOrder = Provider.of<Ordering>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FormBuilder(
            key: _fbKey,
            initialValue: {
              'startdate': DateTime.now(),
              'forOtherType': allOrder.theForOtherData != null
                  ? allOrder.theForOtherData.forOtherType
                  : "تجديد",
              'yearOfManu': allOrder.theForOtherData != null
                  ? allOrder.theForOtherData.yearOfManu
                  : "2020",
              'carModel': allOrder.theForOtherData != null
                  ? allOrder.theForOtherData.carModel
                  : "صالون",
              'howManyYears': allOrder.theForOtherData != null
                  ? allOrder.theForOtherData.howManyYears
                  : "2",
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
                  child: FormBuilderRadio(
                    options: [
                      FormBuilderFieldOption(
                        value: "تجديد",
                      ),
                      FormBuilderFieldOption(
                        value: "تجديد وتحويل",
                      )
                    ],
                    attribute: "forOtherType",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "نوع التامين",
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
                  child: FormBuilderDropdown(
                    items: [
                      DropdownMenuItem(
                        child: Text("2000"),
                        value: "2000",
                      ),
                      DropdownMenuItem(
                        child: Text("2001"),
                        value: "2001",
                      ),
                      DropdownMenuItem(
                        child: Text("2002"),
                        value: "2002",
                      ),
                      DropdownMenuItem(
                        child: Text("2003"),
                        value: "2003",
                      ),
                      DropdownMenuItem(
                        child: Text("2004"),
                        value: "2004",
                      ),
                      DropdownMenuItem(
                        child: Text("2005"),
                        value: "2005",
                      ),
                      DropdownMenuItem(
                        child: Text("2006"),
                        value: "2006",
                      ),
                      DropdownMenuItem(
                        child: Text("2007"),
                        value: "2007",
                      ),
                      DropdownMenuItem(
                        child: Text("2008"),
                        value: "2008",
                      ),
                      DropdownMenuItem(
                        child: Text("2009"),
                        value: "2009",
                      ),
                      DropdownMenuItem(
                        child: Text("2010"),
                        value: "2010",
                      ),
                      DropdownMenuItem(
                        child: Text("2011"),
                        value: "2011",
                      ),
                      DropdownMenuItem(
                        child: Text("2012"),
                        value: "2012",
                      ),
                      DropdownMenuItem(
                        child: Text("2013"),
                        value: "2013",
                      ),
                      DropdownMenuItem(
                        child: Text("2014"),
                        value: "2014",
                      ),
                      DropdownMenuItem(
                        child: Text("2015"),
                        value: "2015",
                      ),
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
                    onChanged: (value) {
                      setHowManyYears(value);
                    },
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
                  child: FormBuilderDropdown(
                    style: TextStyle(
                        fontSize: 55,
                        color: Theme.of(context).bottomAppBarColor),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "صالون",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "صالون",
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
                          "وانيت",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "وانيت",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "اخرى",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "اخرى",
                      ),
                    ],
                    attribute: "carModel",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "موديل السيارة",
                        labelStyle: TextStyle(fontSize: 18)),
                  ),
                ),
                selectedItem == "one"
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
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "1",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "1",
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
                      )
                    : SizedBox(),
                selectedItem == "two"
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
                          items: [
                            DropdownMenuItem(
                              child: Text(
                                "1",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "1",
                            ),
                            DropdownMenuItem(
                              child: Text(
                                "2",
                                style: TextStyle(fontSize: 20),
                              ),
                              value: "2",
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
                      )
                    : SizedBox(),
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

                    allOrder.theForOtherData = ForOtherFormModel(
                      yearOfManu: _fbKey.currentState.value['yearOfManu'],
                      carModel: _fbKey.currentState.value['carModel'],
                      forOtherType: _fbKey.currentState.value['forOtherType'],
                      howManyYears: _fbKey.currentState.value['howManyYears'],
                    );

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
