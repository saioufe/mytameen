import 'package:flutter/material.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:provider/provider.dart';

import '../insurance_icons_icons.dart';

class NewsHomeTemplate extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;
  final PageController pageController;
  NewsHomeTemplate({
    this.animationController,
    this.animation,
    this.pageController,
  });

  @override
  _NewsHomeTemplateState createState() => _NewsHomeTemplateState();
}

class _NewsHomeTemplateState extends State<NewsHomeTemplate> {
  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<Languages>(context, listen: false);
    final allposts = Provider.of<AllProvider>(context, listen: false);

    return allposts.newsDataOffline == null
        ? FutureBuilder(
            future: allposts.fetchDataNews(),
            builder: (ctx, authResultSnap) {
              if (authResultSnap.connectionState == ConnectionState.waiting) {
                return AnimatedBuilder(
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
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      widget.pageController.jumpToPage(1);
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
                                    lang.translation['news']
                                        [Languages.selectedLanguage],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context).bottomAppBarColor,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Stack(
                              children: <Widget>[
                                Container(
                                    height: 220,
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    decoration: BoxDecoration(
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
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(18.0),
                                      child: Image.asset(
                                        "assets/images/car.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                    // child: ,
                                    ),
                                Positioned(
                                  top: 170,
                                  left: 25,
                                  child: Container(
                                    padding: EdgeInsets.only(right: 10),
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Text(
                                      "هنا يتم كتابة عنوان الموضوع ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
    final allposts = Provider.of<AllProvider>(context, listen: false);

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
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          pageController.jumpToPage(1);
                        },
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
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
                                  color: Theme.of(context).bottomAppBarColor,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        lang.translation['news'][Languages.selectedLanguage],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).bottomAppBarColor,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        height: 220,
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18.0),
                          child: Image.network(
                            "${AllProvider.hostName}/images/posts/${allposts.news[0].postImage}",
                            fit: BoxFit.cover,
                          ),
                        )
                        // child: ,
                        ),
                    Positioned(
                      top: 170,
                      left: 25,
                      child: Container(
                        padding: EdgeInsets.only(right: 10),
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Text(
                          allposts.news[0].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
