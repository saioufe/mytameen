import 'package:flutter/material.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/providers/registrition.dart';
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

  @override
  Widget build(BuildContext context) {
    Provider.of<Registration>(context, listen: false).googleFirstMove();
    Provider.of<Registration>(context, listen: false).checkLogin();
    return Container(
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
                                padding: const EdgeInsets.all(8.0),
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
