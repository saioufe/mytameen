import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_tameen/insurance_icons_icons.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/providers/registrition.dart';
import 'package:my_tameen/screens/account-screen.dart';
import 'package:my_tameen/screens/categories-screen.dart';
import 'package:my_tameen/screens/home-screen.dart';
import 'package:my_tameen/screens/login_page.dart';
import 'package:my_tameen/screens/news-screen.dart';
import 'package:my_tameen/screens/offers-screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'myOrders-screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

AnimationController animationController;
AnimationController animationController2;
AnimationController animationController3;

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  Widget tabBody = Container(
    color: Color(0xFFecedf1),
  );
  int _currentIndex = Languages.selectedLanguage == 0 ? 3 : 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    tabBody = CategoriesScreen(animationController: animationController);

    animationController2 = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    tabBody = HomeScreen(animationController: animationController2);

    animationController3 = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    tabBody = HomeScreen(animationController: animationController3);
    _pageController = PageController(initialPage: 3);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<Languages>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Image.asset("assets/images/what.png"),
        backgroundColor: Colors.transparent,
        onPressed: () async {
          final url = "https://wa.me/17273332751";
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
      ),
      

      body: SizedBox.expand(
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: Languages.selectedLanguage == 0
                ? <Widget>[
                    Registration.isLogin == true
                        ? AccountScreen(
                            animationController3,
                            _pageController,
                          )
                        : LoginPage(
                            _pageController,
                          ),
                    NewsScreen(),
                    CategoriesScreen(animationController: animationController),
                    HomeScreen(
                      animationController: animationController2,
                      pagecontroll: _pageController,
                    ),
                  ]
                : <Widget>[
                    HomeScreen(
                      animationController: animationController2,
                      pagecontroll: _pageController,
                    ),
                    CategoriesScreen(animationController: animationController),
                    NewsScreen(),
                    Registration.isLogin == true
                        ? AccountScreen(
                            animationController3,
                            _pageController,
                          )
                        : LoginPage(
                            _pageController,
                          ),
                  ]),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            color: Colors.white),
        height: 50,
        child: BottomNavyBar(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            itemCornerRadius: 30,
            showElevation: false,
            animationDuration: Duration(milliseconds: 100),
            backgroundColor: Colors.transparent,
            selectedIndex: _currentIndex,
            onItemSelected: (index) {
              
              setState(() => _currentIndex = index);
              _pageController.jumpToPage(index);
            },
            items: Languages.selectedLanguage == 0
                ? <BottomNavyBarItem>[
                    BottomNavyBarItem(
                        inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        activeColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        title: Text(
                          lang.translation['myaccount']
                              [Languages.selectedLanguage],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        icon: Icon(MaterialIcons.perm_identity)),
                    BottomNavyBarItem(
                        inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        activeColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        title: Text(
                          lang.translation['news'][Languages.selectedLanguage],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        icon: Icon(MaterialIcons.bubble_chart)),
                    BottomNavyBarItem(
                        inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        activeColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        title: Text(
                          lang.translation['orderpage']
                              [Languages.selectedLanguage],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        icon: Icon(Icons.add_circle)),
                    BottomNavyBarItem(
                        inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        activeColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        title: Text(
                          lang.translation['homeTitle']
                              [Languages.selectedLanguage],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        icon: Icon(Icons.home)),
                  ]
                : <BottomNavyBarItem>[
                    BottomNavyBarItem(
                        inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        activeColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        title: Text(
                          lang.translation['homeTitle']
                              [Languages.selectedLanguage],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        icon: Icon(Icons.home)),
                    BottomNavyBarItem(
                        inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        activeColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        title: Text(
                          lang.translation['orderpage']
                              [Languages.selectedLanguage],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        icon: Icon(Icons.add_circle)),
                    BottomNavyBarItem(
                        inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        activeColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        title: Text(
                          lang.translation['news'][Languages.selectedLanguage],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        icon: Icon(MaterialIcons.bubble_chart)),
                    BottomNavyBarItem(
                        inactiveColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        activeColor:
                            Theme.of(context).primaryColor.withOpacity(0.3),
                        title: Text(
                          lang.translation['myaccount']
                              [Languages.selectedLanguage],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        icon: Icon(MaterialIcons.perm_identity)),
                  ]),
      ),
    );
  }
}
