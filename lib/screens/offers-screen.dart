import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/widgets/news-template.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/allProvider.dart';

class OffersScreen extends StatefulWidget {
  static const routeName = '/offers-screen';

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<Languages>(context, listen: false);

    final allposts = Provider.of<AllProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            lang.translation['LastOffers'][Languages.selectedLanguage],
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "tajawal",
                color: Colors.white,
                fontSize: 28),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      lang.translation['news'][Languages.selectedLanguage],
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).bottomAppBarColor,
                          fontSize: 28),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: allposts.newsDataOffline == null
                          ? FutureBuilder(
                              future: allposts.fetchDataNews(),
                              builder: (ctx, authResultSnap) {
                                if (authResultSnap.connectionState ==
                                    ConnectionState.waiting) {
                                  return Shimmer.fromColors(
                                      baseColor: Color(0xFFebeff2),
                                      highlightColor:
                                          Colors.grey.withOpacity(0.2),
                                      period: Duration(milliseconds: 300),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 335,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.1,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(32))),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            height: 335,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.1,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .canvasColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(32))),
                                          ),
                                        ],
                                      ));
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
                                  return NewsTemplate();
                                }
                              })
                          : NewsTemplate(),
                    ),
                  ),

                  Divider(),

                  //  : NewsTemplate(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
