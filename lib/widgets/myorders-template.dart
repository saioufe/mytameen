import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_tameen/insurance_icons_icons.dart';

class MyOrdersTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (ctx, index) {
            return Dismissible(
              background: slideRightBackground(context),
              confirmDismiss: (confirm) {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0)), //this right here
                        child: Container(
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("هل انت متاكد من حذف القيد",textAlign: TextAlign.right,  style: TextStyle(fontSize: 20),),
                                SizedBox(
                                  width: 320.0,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "حذف",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Theme.of(context).primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              // onDismissed: (d) {

              // },
              key: Key("$index"),
              child: Container(
                margin: EdgeInsets.all(10),
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color:
                          Theme.of(context).bottomAppBarColor.withOpacity(0.01),
                      offset: Offset(3.0, 4.0),
                      spreadRadius: 0.9,
                      blurRadius: 0.4,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(15),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Theme.of(context)
                                  .bottomAppBarColor
                                  .withOpacity(0.2),
                              offset: Offset(2.0, 3.0),
                              blurRadius: 1.4,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Image.asset(
                            "assets/images/png/029-firefighter.png")),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.6,
                          child: Text(
                            "سيف ماهر محمد جمال الدين محمد النعيمي",
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.6,
                          child: Text(
                            "تامين على الغير  ",
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Widget slideRightBackground(BuildContext context) {
  return Container(
    margin: EdgeInsets.all(10),
    height: 110,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      gradient: LinearGradient(
          colors: [Colors.redAccent, Colors.red],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Theme.of(context).bottomAppBarColor.withOpacity(0.01),
          offset: Offset(3.0, 4.0),
          spreadRadius: 0.9,
          blurRadius: 0.4,
        ),
      ],
    ),
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            "حذف",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}
