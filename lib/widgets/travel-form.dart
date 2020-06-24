import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:my_tameen/models/goldForm.dart';
import 'package:my_tameen/models/seaForm.dart';
import 'package:my_tameen/models/travelForm.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class TravelForm extends StatefulWidget {
  final PageController c;
  TravelForm(this.c);
  @override
  _TravelFormState createState() => _TravelFormState();
}

class _TravelFormState extends State<TravelForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  int selectedItem = 2;
  bool startSelect = false;
  void setTheSelectedPackage(String selected) {
    startSelect = true;
    setState(() {
      if (selected == "Silver") {
        selectedItem = 2;
      } else if (selected == "Gold") {
        selectedItem = 1;
      } else {
        selectedItem = 0;
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
              'travelType': allOrder.theTravelData != null
                  ? allOrder.theTravelData.travelType
                  : "فردي",
              'destinition': allOrder.theTravelData != null
                  ? allOrder.theTravelData.destinition
                  : "",
              'duration': allOrder.theTravelData != null
                  ? allOrder.theTravelData.duration
                  : "7",
              'package': allOrder.theTravelData != null
                  ? allOrder.theTravelData.package
                  : "Silver",
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
                        value: "فردي",
                      ),
                      FormBuilderFieldOption(
                        value: "عائلي",
                      )
                    ],
                    attribute: "travelType",
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
                  child: FormBuilderTextField(
                    textInputAction: TextInputAction.done,
                    attribute: "destinition",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "وجهة السفر",
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
                    style: TextStyle(
                        fontSize: 55,
                        color: Theme.of(context).bottomAppBarColor),
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "7 يوم",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "7",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "15 يوم",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "15",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "30 يوم",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "30",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "60 يوم",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "60",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "90 يوم",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "90",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "180 يوم",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "180",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "365 يوم",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "365",
                      ),
                      DropdownMenuItem(
                        child: Text(
                          "730 يوم",
                          style: TextStyle(fontSize: 20),
                        ),
                        value: "730",
                      ),
                    ],
                    attribute: "duration",
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "مدة السفر",
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
                        child: Text(
                          "Silver",
                          style: TextStyle(color: Color(0xff8F9291)),
                        ),
                        value: "Silver",
                      ),
                      DropdownMenuItem(
                        child: Text("Gold",
                            style: TextStyle(color: Color(0xffFADC34))),
                        value: "Gold",
                      ),
                      DropdownMenuItem(
                        child: Text("Platinum",
                            style: TextStyle(color: Color(0xffE834FA))),
                        value: "Platinum",
                      ),
                    ],
                    attribute: "package",
                    onChanged: (value) {
                      setTheSelectedPackage(value);
                    },
                    validators: [
                      FormBuilderValidators.required(
                          errorText: "هذا الحقل مطلوب")
                    ],
                    decoration: InputDecoration(
                        labelText: "نوع الحزمة",
                        labelStyle: TextStyle(fontSize: 18)),
                  ),
                ),
                // allOrder.newsDataOffline4 == null && startSelect == true
                //     ?
                FutureBuilder(
                    future: allOrder.fetchDataOthers(),
                    builder: (ctx, authResultSnap) {
                      if (authResultSnap.connectionState ==
                          ConnectionState.waiting) {
                        return Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Center(
                            child: CircularProgressIndicator(
                                strokeWidth: 1,
                                backgroundColor:
                                    Theme.of(context).primaryColor),
                          ),
                        );
                      } else if (authResultSnap.hasError) {
                        print(authResultSnap.error);
                        return RaisedButton(
                          onPressed: () {
                            setState(() {
                              //other.getUserLocation();
                            });
                          },
                          child: Text("تفقد من الاتصال بلانترنت",
                              style: TextStyle(color: Colors.black)),
                        );
                      } else {
                        return Container(
                          margin: EdgeInsets.only(top: 10),
                          //height: 60,
                          width: 380,
                          child: Text("${allOrder.others[selectedItem].desc}"),
                        );
                      }
                    })
                // : Container(
                //     margin: EdgeInsets.only(top: 10),
                //     //height: 60,
                //     width: 380,
                //     child: allOrder.newsDataOffline4 != null &&
                //             startSelect != true
                //         ? Text("${allOrder.others[selectedItem].desc}")
                //         : Text(""))
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

                    allOrder.theTravelData = TravelFormModel(
                      destinition: _fbKey.currentState.value['destinition'],
                      duration: _fbKey.currentState.value['duration'],
                      travelType: _fbKey.currentState.value['travelType'],
                      package: _fbKey.currentState.value['package'],
                    );

                    widget.c.jumpToPage(1);
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
