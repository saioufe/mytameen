import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SearchWidget extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  SearchWidget({
    this.animationController,
    this.animation,
  });

  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.3,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
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
            fontFamily: "tajawal", fontSize: 16.0, color: Colors.black),
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
    );
  }
}
