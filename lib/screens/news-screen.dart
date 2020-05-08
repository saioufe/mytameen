import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_tameen/widgets/news-template.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../providers/allProvider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final allposts = Provider.of<AllProvider>(context, listen: false);
    return Scaffold(
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
                      'الاخبار',
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
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 180.0),
                                    child: Center(
                                        child: CircularProgressIndicator(
                                      backgroundColor:
                                          Theme.of(context).primaryColor,
                                      strokeWidth: 2,
                                    )),
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
