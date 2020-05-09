import 'package:flutter/material.dart';
import 'package:my_tameen/insurance_icons_icons.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:provider/provider.dart';

class CategoryHomeTemplate extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  CategoryHomeTemplate({
    this.animationController,
    this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<Languages>(context, listen: false);
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
                  padding: EdgeInsets.only(right: 6),
                  child: Text(
                    lang.translation['accourdingToCategory'][Languages.selectedLanguage],
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).bottomAppBarColor,
                        fontSize: 20),
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
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
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
                            Image.asset(
                              "assets/images/png/transport1.png",
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              "تامين ضد الغير ",
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
