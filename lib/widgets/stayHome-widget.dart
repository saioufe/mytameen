import 'package:flutter/material.dart';

class StayHomeWidget extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  StayHomeWidget({
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
                40 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  // Container(
                  //   width: MediaQuery.of(context).size.width / 1.3,
                  //   padding: EdgeInsets.only(right: 6),
                  //   child: Text(
                  //     "خلك بامان ... خلك بلبيت",
                  //     textAlign: TextAlign.right,
                  //     style: TextStyle(
                  //         fontWeight: FontWeight.w500,
                  //         color: Theme.of(context).bottomAppBarColor,
                  //         fontSize: 20),
                  //   ),
                  // ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Theme.of(context).primaryColor,
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
                    child: Center(
                      child: Text(
                        "خلك بامان ... خلك بلبيت",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
