// import 'package:flutter/material.dart';
// import 'package:my_tameen/models/companies.dart';
// import 'package:my_tameen/providers/ordering.dart';
// import 'package:provider/provider.dart';

// class AddonTemplate extends StatefulWidget {
//   final int index;
//   final String label;
//   final String description;
//   final Companies company;
//   AddonTemplate({
//     this.label,
//     this.index,
//     this.description,
//     this.company,
//   });
//   @override
//   _AddonTemplateState createState() => _AddonTemplateState();
// }

// class _AddonTemplateState extends State<AddonTemplate> {
//   bool rememberMe = false;
//   double theLastPrice = 2;
//   void _onRememberMeChanged(bool newValue) => setState(() {
//         rememberMe = newValue;

//         if (rememberMe) {
//           // TODO: Here goes your functionality that remembers the user.
//         } else {
//           // TODO: Forget the user
//         }
//       });

//   void initState() {
//     //print(widget.company.not_allow);
//   }

//   String dropdownValue = "10";
//   String dropdownValue2 = 'صغيرة';
//   @override
//   Widget build(BuildContext context) {
//     final allOrders = Provider.of<Ordering>(context, listen: false);

//     widget.index == 1
//         ? theLastPrice = double.parse(allOrders.selectedCompany.not_allow)
//         : widget.index == 2
//             ? theLastPrice =
//                 double.parse(allOrders.selectedCompany.help_allways)
//             : theLastPrice = double.parse(allOrders.selectedCompany.small_10);

//     return Container(
//       margin: EdgeInsets.only(top: 15),
//       width: MediaQuery.of(context).size.width / 1.1,
//       padding: EdgeInsets.all(1),
//       decoration: BoxDecoration(
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//               color: Theme.of(context).bottomAppBarColor.withOpacity(0.1),
//               spreadRadius: 2.0,
//               offset: Offset(0, 2))
//         ],
//         color: Colors.white,
//         borderRadius: BorderRadius.all(
//           Radius.circular(4),
//         ),
//       ),
//       child: Column(
//         children: <Widget>[
//           Text(
//             widget.label,
//             style: TextStyle(fontSize: 20),
//             textAlign: TextAlign.center,
//           ),
//           Divider(),
//           Container(
//             width: 270,
//             child: Text(
//               widget.description,
//               style: TextStyle(
//                   fontSize: 14, color: Theme.of(context).primaryColor),
//               textAlign: TextAlign.right,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Checkbox(
//                     value: rememberMe,
//                     onChanged: (check) {
//                       setState(() {
//                         rememberMe = check;
//                         if (check) {
//                           allOrders.addonsPrice += theLastPrice;
//                           allOrders.changetotalPrice(true, theLastPrice);
//                         } else {
//                           allOrders.changetotalPrice(false, theLastPrice);
//                           allOrders.addonsPrice -= theLastPrice;
//                         }
//                       });
//                     },
//                     activeColor: Colors.white,
//                     checkColor: Colors.blueAccent,
//                   ),
//                   Text("اختيار"),
//                 ],
//               ),
//               widget.index == 0
//                   ? Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: <Widget>[
//                         DropdownButton<String>(
//                           value: dropdownValue2,
//                           icon: Icon(
//                             Icons.arrow_downward,
//                             color: Colors.black54,
//                           ),
//                           iconSize: 15,
//                           style: TextStyle(color: Colors.black),
//                           underline: Container(
//                             height: 1,
//                             color: Colors.black54,
//                           ),
//                           onChanged: (String newValue) {
//                             setState(() {
//                               dropdownValue2 = newValue;
//                             });
//                           },
//                           items: <String>["صغيرة", "متوسطة", "كبيرة"]
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                         ),
//                         SizedBox(
//                           width: 10,
//                         ),
//                         DropdownButton<String>(
//                             value: dropdownValue,
//                             icon: Icon(
//                               Icons.arrow_downward,
//                               color: Colors.black54,
//                             ),
//                             iconSize: 15,
//                             style: TextStyle(color: Colors.black),
//                             underline: Container(
//                               height: 1,
//                               color: Colors.black54,
//                             ),
//                             onChanged: (String newValue) {
//                               setState(() {
//                                 dropdownValue = newValue;
//                               });
//                             },
//                             items: [
//                               DropdownMenuItem(
//                                 child: Text("10 days"),
//                                 value: "10",
//                               ),
//                               DropdownMenuItem(
//                                 child: Text("15 days"),
//                                 value: "15",
//                               ),
//                               DropdownMenuItem(
//                                 child: Text("20 days"),
//                                 value: "20",
//                               ),
//                             ]),
//                       ],
//                     )
//                   : SizedBox(
//                       width: 1,
//                     ),
//               Container(
//                 padding: EdgeInsets.all(1),
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(4),
//                   ),
//                 ),
//                 child: Row(
//                   children: <Widget>[
//                     Icon(
//                       Icons.monetization_on,
//                       color: Colors.white,
//                     ),
//                     Text(
//                       theLastPrice.toStringAsFixed(2),
//                       style: TextStyle(fontSize: 14, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
