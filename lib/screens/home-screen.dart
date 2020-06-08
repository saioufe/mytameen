import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/providers/registrition.dart';
import 'package:my_tameen/screens/privecy-policies-screen.dart';
import 'package:my_tameen/screens/questions-screen.dart';
import 'package:my_tameen/widgets/category-home-template.dart';
import 'package:my_tameen/widgets/news-home-template.dart';
import 'package:my_tameen/widgets/offers-home-template.dart';
import 'package:my_tameen/widgets/search-widget.dart';
import 'package:my_tameen/widgets/slider-template.dart';
import 'package:my_tameen/widgets/start-order-widget.dart';
import 'package:my_tameen/widgets/stayHome-widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  final AnimationController animationController;
  final PageController pagecontroll;
  const HomeScreen({Key key, this.animationController, this.pagecontroll})
      : super(key: key);
  _HomeScreenState createState() => _HomeScreenState();
}

Animation<double> topBarAnimation;

List<Widget> listViews = List<Widget>();
var scrollController = ScrollController();
double topBarOpacity = 0.0;

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    topBarAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: widget.animationController,
          curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)),
    );
    addAllListData();
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          if (this.mounted) {
            setState(() {
              topBarOpacity = 1.0;
            });
          }
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          if (this.mounted) {
            setState(() {
              topBarOpacity = scrollController.offset / 24;
            });
          }
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          if (this.mounted) {
            setState(() {
              topBarOpacity = 0.0;
            });
          }
        }
      }
    });

    super.initState();
  }

  void addAllListData() {
    var count = 12;

    if (AllProvider.buildOnce1 == false) {
      listViews.add(
        SliderTemplate(
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
              curve:
                  Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );
      // listViews.add(
      //   SizedBox(
      //     height: 30,
      //   ),
      // );
      // listViews.add(
      //   SearchWidget(
      //     animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //         parent: widget.animationController,
      //         curve:
      //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
      //     animationController: widget.animationController,
      //   ),
      // );

      listViews.add(
        SizedBox(
          height: 30,
        ),
      );
      listViews.add(
        StayHomeWidget(
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
              curve:
                  Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );
      listViews.add(
        SizedBox(
          height: 30,
        ),
      );
      listViews.add(
        NewsHomeTemplate(
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
              curve:
                  Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
          pageController: widget.pagecontroll,
        ),
      );
      listViews.add(
        SizedBox(
          height: 30,
        ),
      );
      listViews.add(
        CategoryHomeTemplate(
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
              curve:
                  Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
          pageController: widget.pagecontroll,
        ),
      );
      listViews.add(
        SizedBox(
          height: 30,
        ),
      );
      listViews.add(
        OffersHomeTemplate(
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
              curve:
                  Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );
      listViews.add(
        SizedBox(
          height: 30,
        ),
      );
      listViews.add(
        StartOrderWidget(
          pageController: widget.pagecontroll,
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
              curve:
                  Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );
      AllProvider.buildOnce1 = true;
    }
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<Languages>(context, listen: false);

    Provider.of<Registration>(context, listen: false).googleFirstMove();
    Provider.of<Registration>(context, listen: false).checkLogin();
    return Scaffold(
      key: _drawerKey,
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                  child: Center(
                      child: Text(
                'My Tameen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ))),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () async {
                        switch (await showDialog<String>(
                            context: context,
                            builder: (BuildContext ctx) {
                              return SimpleDialog(
                                backgroundColor: Theme.of(context).canvasColor,
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
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
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
                                            color: Languages.selectedLanguage ==
                                                    0
                                                ? Theme.of(context).primaryColor
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
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
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
                                            color: Languages.selectedLanguage ==
                                                    1
                                                ? Theme.of(context).primaryColor
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
                            // Text(
                            //   lang.translation['language']
                            //       [Languages.selectedLanguage],
                            //   style: TextStyle(
                            //       color: Theme.of(context).bottomAppBarColor,
                            //       fontSize: 11,
                            //       fontWeight: FontWeight.w900),
                            // ),
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
                                  fontSize: 15.0, fontWeight: FontWeight.w600)),
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
                    lang.translation['contactuss'][Languages.selectedLanguage],
                    Icon(
                      Icons.headset_mic,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(QuestionsScreen.routeName);
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
                      lang.translation['policies'][Languages.selectedLanguage],
                      Icon(
                        Icons.error_outline,
                        color: Theme.of(context).primaryColor,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
      body: Container(
        color: Theme.of(context).canvasColor,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              getMainListViewUI(),
              getAppBarUI(),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return true;
  }

  Widget getMainListViewUI() {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    final lang = Provider.of<Languages>(context, listen: false);

    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: topBarAnimation,
              child: new Transform(
                transform: new Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(topBarOpacity),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0)),
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
                                padding: const EdgeInsets.only(left: 78.0),
                                child: Text(
                                  lang.translation['homeTitle']
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
                            FlatButton(
                              child: Icon(
                                MaterialIcons.dehaze,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                print("Sasa");
                                if (_drawerKey.currentState.isEndDrawerOpen) {
                                  _drawerKey.currentState.openDrawer();
                                } else {
                                  _drawerKey.currentState.openEndDrawer();
                                }
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}

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
