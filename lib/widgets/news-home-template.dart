import 'package:flutter/material.dart';

import '../insurance_icons_icons.dart';

class NewsHomeTemplate extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  NewsHomeTemplate({
    this.animationController,
    this.animation,
  });
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
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              size: 18,
                            ),
                          ),
                          Text(
                            'المزيد',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Theme.of(context).bottomAppBarColor,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Text(
                        'الاخبار',
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
                          child: Image.asset(
                            "assets/images/mohammed.jpg",
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
                          "هنا يتم كتابة عنوان الموضوع سيف ماهر",
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
