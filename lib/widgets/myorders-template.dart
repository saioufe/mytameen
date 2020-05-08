import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_tameen/insurance_icons_icons.dart';

class MyOrdersTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 1.3,
      child: ListView.builder(
          itemCount: 15,
          itemBuilder: (ctx, index) {
            return Container(
              margin: EdgeInsets.all(10),
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color:
                        Theme.of(context).bottomAppBarColor.withOpacity(0.01),
                    offset: Offset(3.0, 4.0),
                    spreadRadius: 0.9,
                    blurRadius: 0.4,
                  ),
                ],
              ),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Positioned(
                    top: 5,
                    left: -10,
                    child: Container(
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
                        child: Image.asset("assets/images/png/transport2.png")),
                  ),
                  Positioned(
                    top: 35,
                    right: 20,
                    child: Text(
                      "\$-50",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    right: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      "\$-50",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
