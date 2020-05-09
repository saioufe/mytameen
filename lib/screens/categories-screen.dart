import 'package:flutter/material.dart';
import 'package:my_tameen/providers/allProvider.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  final AnimationController animationController;

  const CategoriesScreen({Key key, this.animationController}) : super(key: key);
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

Animation<double> topBarAnimation;

List<Widget> listViews = List<Widget>();
var scrollController = ScrollController();
double topBarOpacity = 0.0;

class _CategoriesScreenState extends State<CategoriesScreen> {
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
    var count = 1;

    if (AllProvider.buildOnce2 == false) {
      listViews.add(
        MainData(
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
              curve:
                  Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );
      AllProvider.buildOnce2 = true;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                            // SizedBox(
                            //   height: 38,
                            //   width: 38,
                            //   child: InkWell(
                            //     highlightColor: Colors.transparent,
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(32.0)),
                            //     onTap: () {
                            //       Navigator.pop(context);
                            //     },
                            //     child: Center(
                            //       child: Icon(
                            //         Icons.keyboard_arrow_left,
                            //         color: Theme.of(context).bottomAppBarColor,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "الفئات",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    //fontFamily: FintnessAppTheme.fontName3,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 22 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: Theme.of(context).bottomAppBarColor,
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   width: 35,
                            //   height: 35,
                            //   decoration: BoxDecoration(
                            //     color: Theme.of(context).bottomAppBarColor
                            //         .withOpacity(topBarOpacity * 0.1),
                            //     borderRadius: BorderRadius.all(
                            //       Radius.circular(20),
                            //     ),
                            //   ),
                            //   child: InkWell(
                            //     child: Icon(Icons.data_usage),
                            //     onTap: () {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //           builder: (context) => AllInsertsScreen(
                            //               animationController:
                            //                   widget.animationController),
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
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

class MainData extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  const MainData({Key key, this.animationController, this.animation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation.value), 0.0),
              child: Column(
                children: <Widget>[
                  // SizedBox(
                  //   height: 50,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: SizedBox(
                  //         width: MediaQuery.of(context).size.width / 2,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Center(
                  //         child: Text(
                  //           'الفئات',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.w500,
                  //               color: Theme.of(context).bottomAppBarColor,
                  //               fontSize: 28),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: GridView.builder(
                      // controller: scrollController,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.5,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            // border: Border.all(color: Theme.of(context).primaryColor ,width: 2),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.white70.withOpacity(0.96),
                                  BlendMode.srcATop),
                              repeat: ImageRepeat.repeatY,
                              image: AssetImage(
                                  "assets/images/png/transport1.png"),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Theme.of(context)
                                    .bottomAppBarColor
                                    .withOpacity(0.2),
                                offset: Offset(2.0, 3.0),
                                blurRadius: 1.4,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Text(
                                      "تامين السفر والسياحة",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                          color: Theme.of(context)
                                              .bottomAppBarColor
                                              .withOpacity(0.2),
                                          offset: Offset(2.0, 3.0),
                                          blurRadius: 1.4,
                                        ),
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Image.asset(
                                        "assets/images/png/transport1.png"),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 30.0),
                                child: Text(
                                  "هنا يتم وضع وصف نوع التامين بلتفصيل يفضل شرح بسيط مو مليون كلمة سيف ماهر محمد جمال الدين",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.justify,
                                  textDirection: TextDirection.rtl,
                                  maxLines: 3,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          );
        });
  }
}
