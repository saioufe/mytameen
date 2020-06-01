import 'package:flutter/material.dart';
import 'package:my_tameen/models/categories.dart';
import 'package:my_tameen/models/services.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/widgets/service-widget.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class CategoryPressedScreen extends StatefulWidget {
  static const routeName = '/services-screen';

  @override
  _CategoryPressedScreenState createState() => _CategoryPressedScreenState();
}

class _CategoryPressedScreenState extends State<CategoryPressedScreen> {
  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<Languages>(context, listen: false);
    final allPro = Provider.of<AllProvider>(context, listen: false);
    final theCat = ModalRoute.of(context).settings.arguments as Categories;

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            theCat.title,
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "tajawal",
                color: Colors.white,
                fontSize: 28),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
            child: FutureBuilder(
                future: allPro.fetchDataServices(theCat.title),
                builder: (ctx, authResultSnap) {
                  if (authResultSnap.connectionState ==
                      ConnectionState.waiting) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: CircularProgressIndicator(),
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
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: allPro.services.map((item) {
                          return ServiceWidget(
                            services: Services(
                              description: item.description,
                              images: item.images,
                            ),
                          );
                        }).toList());
                  }
                })),
      ),
    );
  }
}
