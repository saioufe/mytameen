import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_tameen/widgets/category-home-template.dart';
import 'package:my_tameen/widgets/news-home-template.dart';
import 'package:my_tameen/widgets/offers-home-template.dart';
import 'package:my_tameen/widgets/slider-template.dart';
import 'package:my_tameen/widgets/start-order-widget.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).canvasColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'الرئيسية',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).bottomAppBarColor,
                            fontSize: 28),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color:
                          Theme.of(context).bottomAppBarColor.withOpacity(0.01),
                      offset: Offset(3.0, 4.0),
                      blurRadius: 0.4,
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                      fontFamily: "tajawal",
                      fontSize: 16.0,
                      color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Ionicons.ios_search,
                        color: Theme.of(context).accentColor,
                        size: 22.0,
                      ),
                    ),
                    hintText: "البحث السريع",
                    hintStyle: TextStyle(fontFamily: 'tajawal', fontSize: 17.0),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: SliderTemplate(),
              ),
              SizedBox(
                height: 30,
              ),
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
                      color:
                          Theme.of(context).bottomAppBarColor.withOpacity(0.2),
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

              SizedBox(
                height: 30,
              ),
              NewsHomeTemplate(), // this is the news section for the home
              SizedBox(
                height: 30,
              ),
              CategoryTemplate(), // this is the category section for the home
              SizedBox(
                height: 30,
              ),
              OffersHomeTemplate(), // this is the offers section for the home
              SizedBox(
                height: 30,
              ),

              StartOrderWidget(), // this is the widget for start the order

              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
