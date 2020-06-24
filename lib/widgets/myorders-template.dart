import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_expansion_tile.dart';
import 'package:my_tameen/insurance_icons_icons.dart';
import 'package:my_tameen/models/forOther.dart';
import 'package:my_tameen/models/goldForm.dart';
import 'package:my_tameen/models/orders.dart';
import 'package:my_tameen/models/seaForm.dart';
import 'package:my_tameen/models/travelForm.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:provider/provider.dart';

class MyOrdersTemplate extends StatefulWidget {
  final Orders order;

  MyOrdersTemplate({
    this.order,
  });
  @override
  _MyOrdersTemplateState createState() => _MyOrdersTemplateState();
}

class _MyOrdersTemplateState extends State<MyOrdersTemplate> {
  void initState() {}

  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final allOrder = Provider.of<Ordering>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 20,
       
      ),
      child: Material(
        color: Colors.grey[100],
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: GroovinExpansionTile(
          defaultTrailingIconColor: Colors.grey.withOpacity(0.5),
          leading: widget.order.orderType == "تامين السيارات الذهبي"
              ? Image.asset(
                  "assets/images/png/014-car-1.png",
                  width: 50,
                  height: 50,
                )
              : widget.order.orderType == "تامين ضد الغير"
                  ? Image.asset(
                      "assets/images/png/014-car-1.png",
                      width: 50,
                      height: 50,
                    )
                  : widget.order.orderType == "التامين البحري"
                      ? Image.asset(
                          "assets/images/png/028-car.png",
                          width: 50,
                          height: 50,
                        )
                      : Image.asset(
                          "assets/images/png/005-travel.png",
                          width: 50,
                          height: 50,
                        ),
          title: Text(
            "${widget.order.orderType} المرقم ${widget.order.id} ",
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.black),
          ),
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          inkwellRadius: !isExpanded
              ? BorderRadius.all(Radius.circular(8.0))
              : BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                ),
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Icon(Icons.money_off),
                        Text(
                          ": Price ",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            
                            fontSize: 17,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Divider(
                              thickness: 0.2,
                              color: Colors.black,
                              endIndent: 50,
                              indent: 50,
                            ),
                          ),
                        ),
                        Text(
                          widget.order.price,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Icon(Icons.money_off),
                        Text(
                          ": type ",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            
                            fontSize: 17,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Divider(
                              thickness: 0.2,
                              color: Colors.black,
                              endIndent: 50,
                              indent: 50,
                            ),
                          ),
                        ),
                        Text(
                          widget.order.orderType,
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Theme.of(context).primaryColor),
                        ),
                        // ClipRRect(
                        //   borderRadius: BorderRadius.only(
                        //     bottomLeft: Radius.circular(5.0),
                        //     bottomRight: Radius.circular(5.0),
                        //   ),
                        //   child: Container(
                        //     child: Center(
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(10),
                        //         child: Row(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceEvenly,
                        //           children: <Widget>[
                        //             //Icon(Icons.money_off),
                        //             Text(
                        //               ": date ",
                        //               textAlign: TextAlign.center,
                        //               textDirection: TextDirection.rtl,
                        //               style: TextStyle(
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 17,
                        //               ),
                        //             ),
                        //             Expanded(
                        //               child: Container(
                        //                 child: Divider(
                        //                   thickness: 1,
                        //                   color: Colors.black,
                        //                   endIndent: 50,
                        //                   indent: 50,
                        //                 ),
                        //               ),
                        //             ),
                        //             Text(
                        //               widget.order.startDate,
                        //               textAlign: TextAlign.center,
                        //               textDirection: TextDirection.rtl,
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 17,
                        //                   color:
                        //                       Theme.of(context).primaryColor),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0),
              ),
              child: Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Icon(Icons.money_off),
                        Text(
                          ": status ",
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            
                            fontSize: 17,
                          ),
                        ),
                        // Expanded(
                        //   child: Container(
                        //     child: Divider(
                        //       thickness: 1,
                        //       color: Colors.black,
                        //       endIndent: 50,
                        //       indent: 50,
                        //     ),
                        //   ),
                        // ),
                        widget.order.status == "Pending"
                            ? Expanded(
                                child: Text(
                                  "بإنتظار الموافقه من قبل شركة التأمين",
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.redAccent),
                                ),
                              )
                            : Expanded(
                                child: Text(
                                  "تمت الموافقه وجاري اصدار وثيقة التأمين",
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.green),
                                ),
                              )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    //  Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height / 3.4,
    //   child:
    //       // ListView.builder(
    //       //     itemCount: 1,
    //       //     itemBuilder: (ctx, index) {
    //       //       return
    //       //Dismissible(
    //       //  // background: slideRightBackground(context),

    //       //   confirmDismiss: (confirm) {
    //       //     return showDialog(
    //       //         context: context,
    //       //         builder: (BuildContext context) {
    //       //           return Dialog(
    //       //             shape: RoundedRectangleBorder(
    //       //                 borderRadius:
    //       //                     BorderRadius.circular(20.0)), //this right here
    //       //             child: Container(
    //       //               height: 150,
    //       //               child: Padding(
    //       //                 padding: const EdgeInsets.all(12.0),
    //       //                 child: Column(
    //       //                   mainAxisAlignment: MainAxisAlignment.center,
    //       //                   children: [
    //       //                     Text(
    //       //                       "هل انت متاكد من حذف القيد",
    //       //                       textAlign: TextAlign.right,
    //       //                       style: TextStyle(fontSize: 20),
    //       //                     ),
    //       //                     SizedBox(
    //       //                       width: 320.0,
    //       //                       child: RaisedButton(
    //       //                         onPressed: () {},
    //       //                         child: Text(
    //       //                           "حذف",
    //       //                           style: TextStyle(color: Colors.white),
    //       //                         ),
    //       //                         color: Theme.of(context).primaryColor,
    //       //                       ),
    //       //                     )
    //       //                   ],
    //       //                 ),
    //       //               ),
    //       //             ),
    //       //           );
    //       //         });
    //       //   },
    //       //   // onDismissed: (d) {

    //       //   // },
    //       //   key: Key("$index"),
    //       //   child:
    //       Container(
    //     margin: EdgeInsets.all(10),
    //     height: 110,
    //     decoration: BoxDecoration(
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(10),
    //       ),
    //       gradient: LinearGradient(
    //           colors: [Colors.white, Colors.white],
    //           begin: Alignment.bottomRight,
    //           end: Alignment.topLeft),
    //       boxShadow: <BoxShadow>[
    //         BoxShadow(
    //           color: Theme.of(context).bottomAppBarColor.withOpacity(0.01),
    //           offset: Offset(3.0, 4.0),
    //           spreadRadius: 0.9,
    //           blurRadius: 0.4,
    //         ),
    //       ],
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       children: <Widget>[
    //         Container(
    //             padding: EdgeInsets.all(15),
    //             width: 70,
    //             height: 70,
    //             decoration: BoxDecoration(
    //               boxShadow: <BoxShadow>[
    //                 BoxShadow(
    //                   color:
    //                       Theme.of(context).bottomAppBarColor.withOpacity(0.2),
    //                   offset: Offset(2.0, 3.0),
    //                   blurRadius: 1.4,
    //                 ),
    //               ],
    //               color: Colors.white,
    //               borderRadius: BorderRadius.all(
    //                 Radius.circular(10),
    //               ),
    //             ),
    //             child: widget.order.orderType == "تامين السيارات الذهبي"
    //                 ? Image.asset("assets/images/png/014-car-1.png")
    //                 : widget.order.orderType == "تامين ضد الغير"
    //                     ? Image.asset("assets/images/png/014-car-1.png")
    //                     : widget.order.orderType == "التامين البحري"
    //                         ? Image.asset("assets/images/png/028-car.png")
    //                         : Image.asset("assets/images/png/005-travel.png")),
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: <Widget>[
    //             Container(
    //               width: MediaQuery.of(context).size.width / 1.6,
    //               child: Text(
    //                 widget.order.name,
    //                 overflow: TextOverflow.fade,
    //                 textAlign: TextAlign.right,
    //                 maxLines: 1,
    //                 style: TextStyle(
    //                     color: Theme.of(context).primaryColor,
    //                     fontSize: 20,
    //                     fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //             Container(
    //               width: MediaQuery.of(context).size.width / 1.6,
    //               child: Text(
    //                 widget.order.orderType,
    //                 overflow: TextOverflow.fade,
    //                 textAlign: TextAlign.right,
    //                 maxLines: 1,
    //                 style: TextStyle(
    //                     color: Theme.of(context).primaryColor,
    //                     fontSize: 13,
    //                     fontWeight: FontWeight.bold),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    //   );
    // }),
  }
}

// Widget slideRightBackground(BuildContext context) {
//   return Container(
//     margin: EdgeInsets.all(10),
//     height: 110,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.all(
//         Radius.circular(10),
//       ),
//       gradient: LinearGradient(
//           colors: [Colors.redAccent, Colors.red],
//           begin: Alignment.bottomRight,
//           end: Alignment.topLeft),
//       boxShadow: <BoxShadow>[
//         BoxShadow(
//           color: Theme.of(context).bottomAppBarColor.withOpacity(0.01),
//           offset: Offset(3.0, 4.0),
//           spreadRadius: 0.9,
//           blurRadius: 0.4,
//         ),
//       ],
//     ),
//     child: Align(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           SizedBox(
//             width: 20,
//           ),
//           Icon(
//             Icons.delete,
//             color: Colors.white,
//           ),
//           Text(
//             "حذف",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w700,
//             ),
//             textAlign: TextAlign.left,
//           ),
//         ],
//       ),
//       alignment: Alignment.centerLeft,
//     ),
//   );
// }
