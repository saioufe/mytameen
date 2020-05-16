import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/providers/registrition.dart';
import 'package:my_tameen/screens/contactUs-screen.dart';
import 'package:my_tameen/screens/questions-screen.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../screens/myOrders-screen.dart';
import '../screens/privecy-policies-screen.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class AccountScreen extends StatefulWidget {
  final PageController pagecontroll;
  AccountScreen(this.animationController, this.pagecontroll);

  static const routName = '/settings';

  final AnimationController animationController;

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  String appVersion = " v 1.0.0";
  String currencyName;
  List<Widget> listViews = List<Widget>();
  Color notificationColor = Colors.green;
  bool notificationIsActive;
  String notificationText = "مفعل";
  var platform = MethodChannel('crossingthestreams.io/resourceResolver');
  var scrollController = ScrollController();
  String title = "Saif";
  Animation<double> topBarAnimation;
  Animation<double> topBarAnimationButton;
  double topBarOpacity = 0.0;
  String url = "pandoraltd.com";
  // Future<void> _cancelNotification() async {
  //   await flutterLocalNotificationsPlugin.cancel(0);
  //   await flutterLocalNotificationsPlugin.cancel(1);
  // }

  @override
  void initState() {
    checkNotification();
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

  void checkNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("notification")) {
      notificationIsActive = prefs.getBool("notification");
    }

    if (notificationIsActive == true) {
      await OneSignal.shared.setSubscription(true);
      setState(() {
        notificationText = "مفعل"[Languages.selectedLanguage];
        notificationColor = Colors.green;
      });
    } else {
      await OneSignal.shared.setSubscription(false);
      setState(() {
        notificationText = "متوقف"[Languages.selectedLanguage];
        notificationColor = Colors.red;
      });
    }
    print(notificationIsActive);
  }

  Widget getMainData() {
    final lang = Provider.of<Languages>(context, listen: false);
    final regs = Provider.of<Registration>(context, listen: false);
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
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                  color: Theme.of(context).primaryColor,
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(5),
                  // ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Text(
                      Registration.userName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Languages.selectedLanguage == 0
                  ? Row(
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
                            lang.translation['myaccount']
                                [Languages.selectedLanguage],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(3),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.all(10),
                          child: Text(
                            lang.translation['myaccount']
                                [Languages.selectedLanguage],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Icon(
                          Icons.account_circle,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).pushNamed(
              //       MyOrdersScreen.routeName, // arguments: news
              //     );
              //   },
              //   child: new SettingBar(
              //       lang.translation['myorders'][Languages.selectedLanguage],
              //       Row(
              //         children: <Widget>[
              //           Text(
              //             "4",
              //             style: TextStyle(color: Colors.green, fontSize: 15),
              //           ),
              //           Icon(
              //             Ionicons.md_list_box,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ],
              //       )),
              // ),
              InkWell(
                onTap: () {
                  if (Registration.theMethodRegistered == "1") {
                    regs
                        .logOutFaceBook()
                        .then((value) => Registration.isLogin = false)
                        .then((value) => widget.pagecontroll.jumpToPage(3));
                  } else if (Registration.theMethodRegistered == "2") {
                    regs
                        .handleSignOut()
                        .then((value) => Registration.isLogin = false)
                        .then((value) => widget.pagecontroll.jumpToPage(3));
                  }
                },
                child: new SettingBar(
                    lang.translation['signout'][Languages.selectedLanguage],
                    Icon(
                      Icons.remove_circle_outline,
                      color: Theme.of(context).primaryColor,
                    )),
              ),
              Divider(),
              Languages.selectedLanguage == 0
                  ? Row(
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
                            lang.translation['GeneralSetTitle']
                                [Languages.selectedLanguage],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(3),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.all(10),
                          child: Text(
                            lang.translation['GeneralSetTitle']
                                [Languages.selectedLanguage],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Icon(
                          Icons.adjust,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        notificationIsActive = !notificationIsActive;
                        prefs.setBool("notification", notificationIsActive);
                      });
                      if (notificationIsActive == true) {
                        setState(() {
                          notificationText =
                              lang.translation['notificationStatusActive']
                                  [Languages.selectedLanguage];
                          notificationColor = Colors.green;
                        });
                      } else {
                        setState(() {
                          notificationText =
                              lang.translation['notificationStatusInactive']
                                  [Languages.selectedLanguage];
                          notificationColor = Colors.red;
                        });
                      }
                    },
                    child: new SettingBar(
                      lang.translation['notificationActivate']
                          [Languages.selectedLanguage],
                      Text(
                        notificationIsActive == true
                            ? lang.translation['notificationStatusActive']
                                [Languages.selectedLanguage]
                            : lang.translation['notificationStatusInactive']
                                [Languages.selectedLanguage],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: notificationColor,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () async {
                          switch (await showDialog<String>(
                              context: context,
                              builder: (BuildContext ctx) {
                                return SimpleDialog(
                                  backgroundColor:
                                      Theme.of(context).canvasColor,
                                  elevation: 3,
                                  children: <Widget>[
                                    SimpleDialogOption(
                                      onPressed: () {
                                        //Navigator.pop(context, "1");
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(5),
                                            child: RaisedButton(
                                              onPressed: () {
                                                // HomeScreen.langChanged = 1;

                                                lang.saveLanguageIndex(0);
                                                Languages.selectedLanguage = 0;
                                                setState(() {});
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.asset(
                                                      'icons/flags/png/kw.png',
                                                      package: 'country_icons',
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                  ),
                                                  Text(
                                                    "العربية",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              color:
                                                  Languages.selectedLanguage ==
                                                          0
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Colors.grey,
                                              elevation: 2,
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(5),
                                            child: RaisedButton(
                                              onPressed: () {
                                                //  HomeScreen.langChanged = 1;
                                                setState(() {});
                                                lang.saveLanguageIndex(1);
                                                Languages.selectedLanguage = 1;
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.asset(
                                                      'icons/flags/png/us.png',
                                                      package: 'country_icons',
                                                      width: 40,
                                                      height: 40,
                                                    ),
                                                  ),
                                                  Text(
                                                    "English",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              color:
                                                  Languages.selectedLanguage ==
                                                          1
                                                      ? Theme.of(context)
                                                          .primaryColor
                                                      : Colors.grey,
                                              elevation: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              })) {
                          }
                        },
                        child: new SettingBar(
                          lang.translation['LanguageTitle']
                              [Languages.selectedLanguage],
                          Row(
                            children: <Widget>[
                              Text(
                                lang.translation['language']
                                    [Languages.selectedLanguage],
                                style: TextStyle(
                                    color: Theme.of(context).bottomAppBarColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Languages.selectedLanguage == 0
                                  ? Image.asset(
                                      'icons/flags/png/kw.png',
                                      package: 'country_icons',
                                      width: 40,
                                      height: 40,
                                    )
                                  : Image.asset(
                                      'icons/flags/png/us.png',
                                      package: 'country_icons',
                                      width: 40,
                                      height: 40,
                                    )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Languages.selectedLanguage == 0
                      ? Row(
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
                                lang.translation['mytameen']
                                    [Languages.selectedLanguage],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(3),
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                lang.translation['mytameen']
                                    [Languages.selectedLanguage],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Image.asset(
                              "assets/images/myTameenLogo.png",
                              width: 30,
                              height: 30,
                            ),
                          ],
                        ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => Container(
                          height: 600,
                          child: NetworkGiffyDialog(
                            image: Image.asset(
                              "assets/images/gif.gif",
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                                lang.translation['contactuss']
                                    [Languages.selectedLanguage],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600)),
                            description: Text(
                              '07803043333 8923913141 \n email@test.com',
                              textAlign: TextAlign.center,
                            ),
                            entryAnimation: EntryAnimation.TOP,
                            onOkButtonPressed: () {},
                            onlyCancelButton: true,
                            buttonCancelColor: Theme.of(context).primaryColor,
                            buttonCancelText: Text(
                              "OK",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                    child: new SettingBar(
                      lang.translation['contactuss']
                          [Languages.selectedLanguage],
                      Icon(
                        Icons.headset_mic,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(QuestionsScreen.routeName);
                    },
                    child: new SettingBar(
                        lang.translation['commonQuestions']
                            [Languages.selectedLanguage],
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
                        lang.translation['policies']
                            [Languages.selectedLanguage],
                        Icon(
                          Icons.error_outline,
                          color: Theme.of(context).primaryColor,
                        )),
                  ),
                  Divider(),
                  Languages.selectedLanguage == 0
                      ? Row(
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
                                lang.translation['MoreTitle']
                                    [Languages.selectedLanguage],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(3),
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.all(10),
                              child: Text(
                                lang.translation['MoreTitle']
                                    [Languages.selectedLanguage],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Icon(
                              Icons.merge_type,
                              color: Theme.of(context).primaryColor,
                            ),
                          ],
                        ),
                  new SettingBar(
                    lang.translation['appRating'][Languages.selectedLanguage],
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
                    lang.translation['appVersion'][Languages.selectedLanguage],
                    Text(
                      '$appVersion',
                      style: TextStyle(
                          color: Theme.of(context)
                              .bottomAppBarColor
                              .withOpacity(0.4),
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget getAppBarUI() {
    final lang = Provider.of<Languages>(context, listen: false);
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
                          lang.translation['settingsTitle']
                              [Languages.selectedLanguage],
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
  SettingBar(this.title, this.child);

  final Widget child;
  final String title;

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
