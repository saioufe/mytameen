import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:provider/provider.dart';

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
    final lang = Provider.of<Languages>(context, listen: false);

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                -40 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white,
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
                          hintText: lang.translation['fastsearch']
                              [Languages.selectedLanguage],
                          hintStyle:
                              TextStyle(fontFamily: 'tajawal', fontSize: 17.0),
                        ),
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
