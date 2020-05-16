import 'package:flutter/material.dart';
import 'package:my_tameen/insurance_icons_icons.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/providers/languages.dart';
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
  @override
  Widget build(BuildContext context) {
    final allCategories = Provider.of<AllProvider>(context, listen: false);
    final lang = Provider.of<Languages>(context, listen: false);

    return allCategories.newsDataOffline2 == null
        ? FutureBuilder(
            future: allCategories.fetchDataCategories(),
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
                                      widget.pageController.jumpToPage(2);
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
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.0,
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 10.0,
                                ),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 10),
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
                          pageController.jumpToPage(2);
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
                        lang.translation['accourdingToCategory']
                            [Languages.selectedLanguage],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).bottomAppBarColor,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(
                              allCategories.categories[index].image,
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              allCategories.categories[index].title,
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
    );
  }
}
