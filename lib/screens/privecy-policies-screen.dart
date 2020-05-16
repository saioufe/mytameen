import 'package:flutter/material.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/widgets/myorders-template.dart';
import 'package:provider/provider.dart';

class PoliciesScreen extends StatelessWidget {
  static const routeName = '/policies-screen';
  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<Languages>(context, listen: false);
    final all = Provider.of<AllProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            lang.translation['policies'][Languages.selectedLanguage],
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                      future:
                          all.loadPrivacy(context, Languages.selectedLanguage),
                      builder: (ctx, authResultSnap) {
                        if (authResultSnap.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Container(
                              child: CircularProgressIndicator(
                                backgroundColor: Theme.of(context).primaryColor,
                                strokeWidth: 2,
                              ),
                            ),
                          );
                        } else if (authResultSnap.hasError) {
                          print(authResultSnap.error);
                          return RaisedButton(
                            onPressed: () {},
                            child: Text("تفقد من الاتصال بلانترنت",
                                style: TextStyle(color: Colors.black)),
                          );
                        } else {
                          return Container(
                            margin: EdgeInsets.all(15),
                            color: Theme.of(context).canvasColor,
                            child: Text(
                              authResultSnap.data,
                              textAlign: TextAlign.justify,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                      })),
            ),

            Divider(),

            //  : NewsTemplate(),
          ],
        ),
      ),
    );
  }
}
