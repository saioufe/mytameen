import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:my_tameen/models/goldForm.dart';
import 'package:my_tameen/models/seaForm.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:provider/provider.dart';

class SeaForm extends StatefulWidget {
  final PageController c;
  SeaForm(this.c);
  @override
  _SeaFormState createState() => _SeaFormState();
}

class _SeaFormState extends State<SeaForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  String seaTypevalue = "قوارب ويخوت";
  void setTheSelectedModel(String selected) {
    setState(() {
      if (selected == "قوارب ويخوت") {
        seaTypevalue = "قوارب ويخوت";
      } else if (selected == "جت سكي") {
        seaTypevalue = "جت سكي";
      }
    });
  }

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
              'seaType': allOrder.theSeaData != null
                  ? allOrder.theSeaData.seaType
                  : "قوارب ويخوت",
              'yearOfManu': allOrder.theSeaData != null
                  ? allOrder.theSeaData.yearOfManu
                  : "2020",
              allOrder.theSeaData.seaType == "جت سكي" ? 'limitOfResp' : "10000":null,
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
                        value: "قوارب ويخوت",
                      ),
                      FormBuilderFieldOption(
                        value: "جت سكي",
                      )
                    ],
                    attribute: "seaType",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        setTheSelectedModel(value);
                      });
                    },
                    decoration: InputDecoration(
                        labelText: "نوع المركبة",
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
                    attribute: "yearOfManu",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "سنة الصنع",
                        labelStyle: TextStyle(fontSize: 18)),
                    textAlign: TextAlign.right,
                  ),
                ),
                seaTypevalue == "قوارب ويخوت"
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
                          items: [
                            DropdownMenuItem(
                              child: Text("100000"),
                              value: "100000",
                            ),
                            DropdownMenuItem(
                              child: Text("50000"),
                              value: "50000",
                            ),
                            DropdownMenuItem(
                              child: Text("30000"),
                              value: "30000",
                            ),
                            DropdownMenuItem(
                              child: Text("10000"),
                              value: "10000",
                            ),
                          ],
                          attribute: "limitOfResp",
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "هذا الحقل مطلوب")
                          ],
                          decoration: InputDecoration(
                              labelText: "حدود المسؤلية",
                              labelStyle: TextStyle(fontSize: 18)),
                        ))
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
                          attribute: "limitOfResp",
                          readOnly: true,
                          initialValue: "10000",
                          decoration: InputDecoration(
                              labelText: "حدود المسؤلية",
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

                    allOrder.theSeaData = SeaFormModel(
                      yearOfManu: _fbKey.currentState.value['yearOfManu'],
                      limitOfResp: _fbKey.currentState.value['limitOfResp'],
                      seaType: _fbKey.currentState.value['seaType'],
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
