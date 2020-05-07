
// import 'package:flutter/cupertino.dart';
// import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
// import '../providers/allProvider.dart';

// class WebsitesScreen extends StatefulWidget {
//   @override
//   _WebsitesScreenState createState() => _WebsitesScreenState();
// }

// class _WebsitesScreenState extends State<WebsitesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final allposts = Provider.of<AllProvider>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Theme.of(context).primaryColor,
//           elevation: 0,
//           iconTheme: IconThemeData(color: Colors.white),
//           title: Container(
//             width: MediaQuery.of(context).size.width * 2,
//             height: 70,
//             child: Center(
//               child: Text(
//                 'امثلة المواقع',
//                 style: TextStyle(
//                     fontFamily: 'tajawal',
//                     fontWeight: FontWeight.w500,
//                     color: Colors.white,
//                     fontSize: 28),
//               ),
//             ),
//           )),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20.0),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       child: allposts.newsDataOffline4 == null
//                           ? FutureBuilder(
//                               future: allposts.fetchDataWebsite(),
//                               builder: (ctx, authResultSnap) {
//                                 if (authResultSnap.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return Padding(
//                                     padding: const EdgeInsets.only(top: 180.0),
//                                     child: Center(
//                                         child: CircularProgressIndicator(
//                                       backgroundColor:
//                                           Theme.of(context).primaryColor,
//                                       strokeWidth: 2,
//                                     )),
//                                   );
//                                 } else if (authResultSnap.hasError) {
//                                   print(authResultSnap.error);
//                                   return RaisedButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         //other.getUserLocation();
//                                       });
//                                     },
//                                     child: Text("تفقد من الاتصال بلانترنت",
//                                         style: TextStyle(color: Colors.black)),
//                                   );
//                                 } else {
//                                   return WebsiteTemplate();
//                                 }
//                               })
//                           : WebsiteTemplate(),
//                     ),
//                   ),

//                   Divider(),

//                   //  : NewsTemplate(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
