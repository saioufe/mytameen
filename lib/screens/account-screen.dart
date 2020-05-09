import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
//import '../fintnessAppTheme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:currency_pickers/currency_pickers.dart';
import '../screens/myOrders-screen.dart';
import '../screens/privecy-policies-screen.dart';

class AccountScreen extends StatefulWidget {
  static const routName = '/settings';
  final AnimationController animationController;
  AccountScreen(this.animationController);
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  var platform = MethodChannel('crossingthestreams.io/resourceResolver');
  Animation<double> topBarAnimation;
  Animation<double> topBarAnimationButton;
  List<Widget> listViews = List<Widget>();
  var scrollController = ScrollController();
  double topBarOpacity = 0.0;
  bool notificationIsActive = true;
  String notificationText = "مفعل";
  Color notificationColor = Colors.green.withOpacity(0.5);
  // Future<void> _cancelNotification() async {
  //   await flutterLocalNotificationsPlugin.cancel(0);
  //   await flutterLocalNotificationsPlugin.cancel(1);
  // }

  @override
  void initState() {
    // flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // super.initState();
    // var initializationSettingsAndroid =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');
    // var initializationSettingsIOS = IOSInitializationSettings();
    // var initializationSettings = InitializationSettings(
    //     initializationSettingsAndroid, initializationSettingsIOS);
    // flutterLocalNotificationsPlugin.initialize(initializationSettings);
    topBarAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)),
    );

    //addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
  }

  String appVersion = " v 1.0.0";
  String title = "Saif";
  String url = "pandoraltd.com";
  String currencyName;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainData(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainData() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Container(
        padding: EdgeInsets.only(
          top: AppBar().preferredSize.height +
              MediaQuery.of(context).padding.top +
              24,
          bottom: 62 + MediaQuery.of(context).padding.bottom,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.account_circle,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'حسابي',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  MyOrdersScreen.routeName, // arguments: news
                );
              },
              child: new SettingBar(
                  "طلباتي",
                  Row(
                    children: <Widget>[
                      Text(
                        "4",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      Icon(
                        Ionicons.md_list_box,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  )),
            ),
            InkWell(
              onTap: () {},
              child: new SettingBar(
                  "تسجيل الخروج",
                  Icon(
                    Icons.remove_circle_outline,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.adjust,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'عام',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      notificationIsActive = !notificationIsActive;
                    });
                    if (notificationIsActive == true) {
                      setState(() {
                        notificationText = "مفعل";
                        notificationColor = Colors.green;
                      });
                    } else {
                      setState(() {
                        notificationText = "متوقف";
                        notificationColor = Colors.red;
                      });
                    }
                  },
                  child: new SettingBar(
                    "تفعيل الاشعارات",
                    Text(
                      notificationText,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.0,
                        color: notificationColor,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    switch (await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 3,
                            title: Text('هذه الميزة سوف تاتي لاحقا',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context).canvasColor,
                                  fontSize: 20,
                                )),
                            children: <Widget>[
                              SimpleDialogOption(
                                onPressed: () {
                                  Navigator.pop(context, "1");
                                },
                                child: RaisedButton(
                                  onPressed: null,
                                  elevation: 2,
                                  color: Theme.of(context).primaryColor,
                                  child: const Text(
                                    'حسنا',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        })) {
                      case "1":
                        // Let's go.
                        // ...
                        break;
                    }
                  },
                  child: new SettingBar(
                    "اختر اللغة",
                    Row(
                      children: <Widget>[
                        Text(
                          "اللغة العربية",
                          style: TextStyle(
                              color: Theme.of(context).bottomAppBarColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          'icons/flags/png/kw.png',
                          package: 'country_icons',
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(
                  "assets/images/myTameenLogo.png",
                  width: 30,
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'ماي تاميين',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: new SettingBar(
                "الاتصال بنا",
                Icon(
                  Icons.headset_mic,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: new SettingBar(
                  "الاسئلة الشائعة",
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(PoliciesScreen.routeName);
              },
              child: new SettingBar(
                  "الشروط والاحكام",
                  Icon(
                    Icons.error_outline,
                    color: Theme.of(context).primaryColor,
                  )),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Icon(
                  Icons.merge_type,
                  color: Theme.of(context).primaryColor,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    'المزيد',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            new SettingBar(
              "تقييم التطبيق",
              RatingBar(
                initialRating: 4,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            new SettingBar(
              "اصدار التطبيق",
              Text(
                '$appVersion',
                style: TextStyle(
                    color: Theme.of(context).bottomAppBarColor.withOpacity(0.4),
                    fontSize: 20,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(topBarOpacity),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32.0),
                bottomRight: Radius.circular(32)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Theme.of(context)
                      .bottomAppBarColor
                      .withOpacity(0.4 * topBarOpacity),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16 - 8.0 * topBarOpacity,
                    bottom: 12 - 8.0 * topBarOpacity),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "الاعدادات",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 22 + 6 - 6 * topBarOpacity,
                            letterSpacing: 1.2,
                            color: Theme.of(context).bottomAppBarColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

//  Widget _buildDropdownItem(Country country) => Container(
//         child: Row(
//           children: <Widget>[
//             CountryPickerUtils.getDefaultFlagImage(country),
//             SizedBox(
//               width: 8.0,
//             ),
//             Text("+${country.currencyCode}(${country.isoCode})"),
//           ],
//         ),
//       );

class SettingBar extends StatelessWidget {
  final String title;
  final Widget child;
  SettingBar(this.title, this.child);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 60,
      width: 380,
      padding: EdgeInsets.only(right: 30, left: 30),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Theme.of(context).bottomAppBarColor.withOpacity(0.1),
              offset: Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              letterSpacing: 0.0,
              color: Theme.of(context).bottomAppBarColor,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
