import 'package:flutter/material.dart';
import 'package:my_tameen/insurance_icons_icons.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/screens/category-pressed-screen.dart';
import 'package:provider/provider.dart';

class CategoryHomeTemplate extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;
  final PageController pageController;
  CategoryHomeTemplate({
    this.animationController,
    this.animation,
    this.pageController,
  });

  @override
  _CategoryHomeTemplateState createState() => _CategoryHomeTemplateState();
}

class _CategoryHomeTemplateState extends State<CategoryHomeTemplate> {
  ScrollController gridcontroller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final allCategories = Provider.of<AllProvider>(context, listen: false);
    final lang = Provider.of<Languages>(context, listen: false);
    // PageController gridcontroller;
    // gridcontroller =
    //     PageController(initialPage: allCategories.categories.length - 1);
    return allCategories.newsDataOffline2 == null
        ? FutureBuilder(
            future: allCategories.fetchDataCategories(),
            builder: (ctx, authResultSnap) {
              if (authResultSnap.connectionState == ConnectionState.waiting) {
                return Container(
                  color: Colors.grey.withOpacity(0.1),
                  child: AnimatedBuilder(
                    animation: widget.animationController,
                    builder: (BuildContext context, Widget child) {
                      return FadeTransition(
                        opacity: widget.animation,
                        child: new Transform(
                          transform: new Matrix4.translationValues(
                              0.0, 30 * (1.0 - widget.animation.value), 0.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 1.3,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: Languages.selectedLanguage == 0
                                        ? <Widget>[
                                            InkWell(
                                              onTap: () {
                                                // pageController.jumpToPage(1);
                                              },
                                              child: Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Icon(
                                                      Icons.keyboard_arrow_left,
                                                      size: 18,
                                                    ),
                                                  ),
                                                  Text(
                                                    lang.translation[
                                                            'MoreTitle'][
                                                        Languages
                                                            .selectedLanguage],
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .bottomAppBarColor,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              lang.translation[
                                                      'accourdingToCategory']
                                                  [Languages.selectedLanguage],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .bottomAppBarColor,
                                                  fontSize: 20),
                                            ),
                                          ]
                                        : <Widget>[
                                            Text(
                                              lang.translation[
                                                      'accourdingToCategory']
                                                  [Languages.selectedLanguage],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .bottomAppBarColor,
                                                  fontSize: 20),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // pageController.jumpToPage(1);
                                              },
                                              child: Row(
                                                children: <Widget>[
                                                  Text(
                                                    lang.translation[
                                                            'MoreTitle'][
                                                        Languages
                                                            .selectedLanguage],
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Theme.of(context)
                                                            .bottomAppBarColor,
                                                        fontSize: 15),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 200,
                                child: GridView.builder(
                                  // controller: gridcontroller,
                                  //physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 1.0,
                                    mainAxisSpacing: 10.0,
                                    crossAxisSpacing: 10.0,
                                  ),
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 100,
                                      height: 100,
                                      margin: EdgeInsets.only(bottom: 10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        // borderRadius: BorderRadius.all(
                                        //   Radius.circular(18),
                                        // ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/images/png/transport1.png",
                                            width: 50,
                                            height: 50,
                                          ),
                                          Text(
                                            "التامين",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                            maxLines: 2,
                                            style: TextStyle(fontSize: 17),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
                return Template(
                    animationController: widget.animationController,
                    animation: widget.animation,
                    pageController: widget.pageController,
                    lang: lang);
              }
            })
        : Template(
            animationController: widget.animationController,
            animation: widget.animation,
            pageController: widget.pageController,
            lang: lang);
  }
}

class Template extends StatelessWidget {
  const Template({
    Key key,
    @required this.animationController,
    @required this.animation,
    @required this.pageController,
    @required this.lang,
  }) : super(key: key);

  final AnimationController animationController;
  final Animation animation;
  final PageController pageController;
  final Languages lang;

  @override
  Widget build(BuildContext context) {
    final allCategories = Provider.of<AllProvider>(context, listen: false);
    // PageController gridcontroller;
    // gridcontroller =
    //     PageController(initialPage: allCategories.categories.length - 1);
    return Container(
      color: Colors.grey.withOpacity(0.1),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, 30 * (1.0 - animation.value), 0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: Languages.selectedLanguage == 0
                            ? <Widget>[
                                InkWell(
                                  onTap: () {
                                    if (Languages.selectedLanguage == 0) {
                                      pageController.jumpToPage(2);
                                    } else {
                                      pageController.jumpToPage(1);
                                    }
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Icon(
                                          Icons.keyboard_arrow_left,
                                          size: 18,
                                        ),
                                      ),
                                      Text(
                                        lang.translation['MoreTitle']
                                            [Languages.selectedLanguage],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .bottomAppBarColor,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  lang.translation['accourdingToCategory']
                                      [Languages.selectedLanguage],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context).bottomAppBarColor,
                                      fontSize: 20),
                                ),
                              ]
                            : <Widget>[
                                Text(
                                  lang.translation['accourdingToCategory']
                                      [Languages.selectedLanguage],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context).bottomAppBarColor,
                                      fontSize: 20),
                                ),
                                InkWell(
                                  onTap: () {
                                    pageController.jumpToPage(1);
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        lang.translation['MoreTitle']
                                            [Languages.selectedLanguage],
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .bottomAppBarColor,
                                            fontSize: 15),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Icon(
                                          Icons.keyboard_arrow_right,
                                          size: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: GridView.builder(
                      //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // controller: gridcontroller,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        childAspectRatio: 1.9,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: allCategories.categories.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    CategoryPressedScreen.routeName,
                                    arguments: allCategories.categories[index]);
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  // borderRadius: BorderRadius.all(
                                  //   Radius.circular(18),
                                  // ),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.network(
                                      "${AllProvider.hostName}/images/categories/${allCategories.categories[index].image}",
                                      width: 50,
                                      height: 50,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              allCategories.categories[index].title,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              maxLines: 2,
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
