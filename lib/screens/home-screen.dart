// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:my_tameen/widgets/category-home-template.dart';
// import 'package:my_tameen/widgets/news-home-template.dart';
// import 'package:my_tameen/widgets/offers-home-template.dart';
// import 'package:my_tameen/widgets/slider-template.dart';
// import 'package:my_tameen/widgets/start-order-widget.dart';

// class HomeScreen extends StatelessWidget {
//   TextEditingController searchController = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Theme.of(context).canvasColor,
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 50,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   Expanded(
//                     child: SizedBox(
//                       width: MediaQuery.of(context).size.width / 2,
//                     ),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         'الرئيسية',
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             color: Theme.of(context).bottomAppBarColor,
//                             fontSize: 28),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width / 1.3,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8),
//                   ),
//                   boxShadow: <BoxShadow>[
//                     BoxShadow(
//                       color:
//                           Theme.of(context).bottomAppBarColor.withOpacity(0.01),
//                       offset: Offset(3.0, 4.0),
//                       blurRadius: 0.4,
//                     ),
//                   ],
//                 ),
//                 child: TextField(
//                   controller: searchController,
//                   keyboardType: TextInputType.emailAddress,
//                   style: TextStyle(
//                       fontFamily: "tajawal",
//                       fontSize: 16.0,
//                       color: Colors.black),
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     icon: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Icon(
//                         Ionicons.ios_search,
//                         color: Theme.of(context).accentColor,
//                         size: 22.0,
//                       ),
//                     ),
//                     hintText: "البحث السريع",
//                     hintStyle: TextStyle(fontFamily: 'tajawal', fontSize: 17.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: SliderTemplate(),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                 height: 50,
//                 width: MediaQuery.of(context).size.width / 1.3,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8),
//                   ),
//                   color: Theme.of(context).primaryColor,
//                   boxShadow: <BoxShadow>[
//                     BoxShadow(
//                       color:
//                           Theme.of(context).bottomAppBarColor.withOpacity(0.2),
//                       offset: Offset(2.0, 3.0),
//                       blurRadius: 1.4,
//                     ),
//                   ],
//                 ),
//                 child: Center(
//                   child: Text(
//                     "خلك بامان ... خلك بلبيت",
//                     style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ),
//               ),

//               SizedBox(
//                 height: 30,
//               ),
//               NewsHomeTemplate(), // this is the news section for the home
//               SizedBox(
//                 height: 30,
//               ),
//               CategoryTemplate(), // this is the category section for the home
//               SizedBox(
//                 height: 30,
//               ),
//               OffersHomeTemplate(), // this is the offers section for the home
//               SizedBox(
//                 height: 30,
//               ),

//               StartOrderWidget(), // this is the widget for start the order

//               SizedBox(
//                 height: 30,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/widgets/category-home-template.dart';
import 'package:my_tameen/widgets/news-home-template.dart';
import 'package:my_tameen/widgets/offers-home-template.dart';
import 'package:my_tameen/widgets/search-widget.dart';
import 'package:my_tameen/widgets/start-order-widget.dart';
import 'package:my_tameen/widgets/stayHome-widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  final AnimationController animationController;

  const HomeScreen({Key key, this.animationController}) : super(key: key);
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
    var count = 1;

    if (AllProvider.buildOnce1 == false) {
      listViews.add(
        SearchWidget(
          animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: widget.animationController,
              curve:
                  Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController,
        ),
      );
      // listViews.add(
      //   StayHomeWidget(
      //     animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //         parent: widget.animationController,
      //         curve:
      //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
      //     animationController: widget.animationController,
      //   ),
      // );
      // listViews.add(
      //   NewsHomeTemplate(
      //     animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //         parent: widget.animationController,
      //         curve:
      //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
      //     animationController: widget.animationController,
      //   ),
      // );
      // listViews.add(
      //   CategoryHomeTemplate(
      //     animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //         parent: widget.animationController,
      //         curve:
      //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
      //     animationController: widget.animationController,
      //   ),
      // );
      // listViews.add(
      //   OffersHomeTemplate(
      //     animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //         parent: widget.animationController,
      //         curve:
      //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
      //     animationController: widget.animationController,
      //   ),
      // );
      // listViews.add(
      //   StartOrderWidget(
      //     animation: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      //         parent: widget.animationController,
      //         curve:
      //             Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
      //     animationController: widget.animationController,
      //   ),
      // );
      AllProvider.buildOnce1 = true;
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
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "الرئيسية",
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
