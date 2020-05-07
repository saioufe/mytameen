import 'package:flutter/material.dart';
import 'package:my_tameen/insurance_icons_icons.dart';

class CategoryTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 1.3,
          padding: EdgeInsets.only(right: 6),
          child: Text(
            'تسوق حسب الفئات',
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
                      color:
                          Theme.of(context).bottomAppBarColor.withOpacity(0.2),
                      offset: Offset(2.0, 3.0),
                      blurRadius: 1.4,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      InsuranceIcons.elderly,
                      color: Theme.of(context).primaryColor,
                      size: 55,
                    ),
                    Text(
                      "تامين السفر",
                      style: TextStyle(fontSize: 17),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
