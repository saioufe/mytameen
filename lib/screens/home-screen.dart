import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_tameen/widgets/slider-template.dart';

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
                    Radius.circular(10),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.of(context).bottomAppBarColor.withOpacity(0.01),
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
                    icon: Icon(
                      Ionicons.ios_search,
                      color: Colors.black,
                      size: 22.0,
                    ),
                    hintText: "البحث السريع",
                    hintStyle: TextStyle(fontFamily: 'tajawal', fontSize: 17.0),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: SliderTemplate(),
              ),
              SizedBox(
                height: 340,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
