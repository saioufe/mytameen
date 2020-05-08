import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_tameen/insurance_icons_icons.dart';
import 'package:my_tameen/screens/account-screen.dart';
import 'package:my_tameen/screens/categories-screen.dart';
import 'package:my_tameen/screens/home-screen.dart';
import 'package:my_tameen/screens/news-screen.dart';
import 'package:my_tameen/screens/offers-screen.dart';
import 'package:url_launcher/url_launcher.dart';

import 'myOrders-screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 3;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    //_pageController.jumpToPage(3);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[
            AccountScreen(),
            NewsScreen(),
            CategoriesScreen(),
            HomeScreen(),
          ],
        ),
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
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
                activeColor: Theme.of(context).primaryColor.withOpacity(0.3),
                title: Text(
                  'حسابي',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                icon: Icon(MaterialIcons.perm_identity)),
            BottomNavyBarItem(
                inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
                activeColor: Theme.of(context).primaryColor.withOpacity(0.3),
                title: Text(
                  'الاخبار',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                icon: Icon(MaterialIcons.bubble_chart)),
            BottomNavyBarItem(
                inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
                activeColor: Theme.of(context).primaryColor.withOpacity(0.3),
                title: Text(
                  'الفئات',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                icon: Icon(MaterialIcons.turned_in_not)),
            BottomNavyBarItem(
                inactiveColor: Theme.of(context).primaryColor.withOpacity(0.3),
                activeColor: Theme.of(context).primaryColor.withOpacity(0.3),
                title: Text(
                  'الرئيسية',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                icon: Icon(Icons.home)),
          ],
        ),
      ),
    );
  }
}
