import 'package:flutter/material.dart';

import '../insurance_icons_icons.dart';

class OffersHomeTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                'اخر العروض',
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
                      color:
                          Theme.of(context).bottomAppBarColor.withOpacity(0.2),
                      offset: Offset(2.0, 3.0),
                      blurRadius: 1.4,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: Image.asset(
                    "assets/images/slider2.png",
                    fit: BoxFit.cover,
                  ),
                )
                // child: ,
                ),
            Positioned(
              top: 170,
              left: 25,
              child: Container(
                padding: EdgeInsets.only(right:10),
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
    );
  }
}
