import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_tameen/insurance_icons_icons.dart';
import 'package:my_tameen/screens/account-screen.dart';
import 'package:my_tameen/screens/categories-screen.dart';
import 'package:my_tameen/screens/home-screen.dart';
import 'package:my_tameen/screens/offers-screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            AccountScreen(),
            OffersScreen(),
            CatergoriesScreen(),
            HomeScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            color: Colors.white),
        height: 80,
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
                inactiveColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor,
                title: Text(
                  'حسابي',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                icon: Icon(Entypo.man)),
            BottomNavyBarItem(
                inactiveColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor,
                title: Text(
                  'العروض',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                icon: Icon(Entypo.shop)),
            BottomNavyBarItem(
                inactiveColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor,
                title: Text(
                  'الفئات',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                icon: Icon(Entypo.text_document_inverted)),
            BottomNavyBarItem(
                inactiveColor: Theme.of(context).primaryColor,
                activeColor: Theme.of(context).primaryColor,
                title: Text(
                  'الرئيسية',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                icon: Icon(Entypo.home)),
          ],
        ),
      ),
    );
  }
}
