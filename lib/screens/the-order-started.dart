import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:my_tameen/models/categories.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/widgets/companies.dart';
import 'package:my_tameen/widgets/companiesForOther.dart';
import 'package:my_tameen/widgets/companiesSea.dart';
import 'package:my_tameen/widgets/companiesTravel.dart';
import 'package:my_tameen/widgets/forOther-form.dart';
import 'package:my_tameen/widgets/gold-form.dart';
import 'package:my_tameen/widgets/last-page-order-forOther.dart';
import 'package:my_tameen/widgets/last-page-order-sea.dart';
import 'package:my_tameen/widgets/last-page-order-travel.dart';
import 'package:my_tameen/widgets/last-page-order.dart';
import 'package:my_tameen/widgets/sea-form.dart';
import 'package:my_tameen/widgets/travel-form.dart';
import 'package:provider/provider.dart';

class TheStartOrder extends StatefulWidget {
  static const routeName = '/start-order-gold-screen';

  @override
  _TheStartOrderState createState() => _TheStartOrderState();
}

class _TheStartOrderState extends State<TheStartOrder> {
  PageController c = new PageController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  String thePage = "البيانات";
  int pageNumber = 0;

  void setThePageSetUppers(int page) {
    pageNumber = page;
    setState(() {
      if (page == 0) {
        thePage = "البيانات";
      } else if (page == 1) {
        thePage = "الشركة";
      } else {
        thePage = "معلومات";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theCat = ModalRoute.of(context).settings.arguments as Categories;
    final appot = Provider.of<AllProvider>(context, listen: false);

    List<Widget> theGoldCarsWidget = [
      GoldForm(c),
      CompaniesWidget(c),
      LastPageOrder(c),
    ];
    List<Widget> theForOtherCarsWidget = [
      ForOtherForm(c),
      CompaniesWidgetForOther(c),
      LastPageOrderForOther(c),
    ];
    List<Widget> theSeaWidget = [
      SeaForm(c),
      CompaniesWidgetSea(c),
      LastPageOrderSea(c),
    ];
    List<Widget> theTravelWidget = [
      TravelForm(c),
      CompaniesWidgetTravel(c),
      LastPageOrderTravel(c),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        centerTitle: true,
        title: Container(
          child: Text(
            theCat.title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "tajawal",
                color: Theme.of(context).primaryColor,
                fontSize: 28),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text("البيانات"),
                    onPressed: pageNumber >= 0
                        ? () {
                            c.jumpToPage(0);
                          }
                        : null,
                  ),
                  SizedBox(
                    width: 20,
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  FlatButton(
                    child: Text("الشركة"),
                    onPressed: pageNumber >= 1
                        ? () {
                            c.jumpToPage(1);
                          }
                        : null,
                  ),
                  SizedBox(
                    width: 20,
                    child: Divider(
                      thickness: 3,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  FlatButton(
                    child: Text("معلومات"),
                    onPressed: pageNumber >= 2
                        ? () {
                            c.jumpToPage(2);
                          }
                        : null,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.3,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: c,
                  physics: new NeverScrollableScrollPhysics(),
                  children: theCat.title == "تأمين السيارت الشامل ( الذهبي )"
                      ? theGoldCarsWidget
                      : theCat.title == "التأمين البحري"
                          ? theSeaWidget
                          : theCat.title == "تأمين السفر"
                              ? theTravelWidget
                              : theCat.title == "تأمين السيارت ضد الغير"
                                  ? theForOtherCarsWidget
                                  : theGoldCarsWidget,
                  onPageChanged: (page) {
                    setThePageSetUppers(page);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showInSnackBar(String value, BuildContext context) {
    final snackBar = SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    );

// Find the Scaffold in the widget tree and use it to show a SnackBar.

    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
