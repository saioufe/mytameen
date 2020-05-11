import 'package:flutter/material.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/screens/contactUs-screen.dart';
import 'package:my_tameen/screens/main-screen.dart';
import 'package:my_tameen/screens/offers-screen.dart';
import 'package:my_tameen/screens/pressed-news-screen.dart';
import 'package:my_tameen/screens/questions-screen.dart';
import 'package:provider/provider.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import './screens/myOrders-screen.dart';
import './screens/privecy-policies-screen.dart';

void main() async {
//Remove this method to stop OneSignal Debugging
//   WidgetsFlutterBinding.ensureInitialized();
//   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

//   OneSignal.shared.init("34a10f05-fcb0-464e-bc8a-262bdb922960", iOSSettings: {
//     OSiOSSettings.autoPrompt: false,
//     OSiOSSettings.inAppLaunchUrl: false
//   });
//   OneSignal.shared
//       .setInFocusDisplayType(OSNotificationDisplayType.notification);

// // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 6)
//   await OneSignal.shared
//       .promptUserForPushNotificationPermission(fallbackToSettings: true);

  runApp(
      // MultiProvider(
      //     providers: [
      //       ChangeNotifierProvider.value(
      //         value: AllProvider(),
      //       ),
      //     ],
      //     child:
      MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: AllProvider(),
      ),
      ChangeNotifierProvider.value(
        value: Languages(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my tameen',
      theme: ThemeData(
        fontFamily: 'frutiger',
        textTheme: TextTheme(
          subtitle2: TextStyle(
            fontFamily: "frutiger",
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(54, 86, 119, 1),
          ),
        ),
        canvasColor: Color(0xFFecedf1),
        primaryColor: Color.fromRGBO(54, 86, 119, 1),
        accentColor: Color(0xFF546E7A),
        bottomAppBarColor: Color(0xff313e4b),
        appBarTheme: AppBarTheme(
          color: Color(0xFF37d2b3),
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      home: MainScreen(),

      // SplashScreen.navigate(
      //   name: 'assets/images/hairderLab.flr',
      //   next: (_) => MainScreen(),
      //   until: () => Future.delayed(Duration(seconds: 1)),
      //   startAnimation: 'Untitled',
      //   backgroundColor: Colors.white,
      //   endAnimation: '1',
      // ),
      routes: {
        NewsPressedScreen.routeName: (ctx) => NewsPressedScreen(),
        MyOrdersScreen.routeName: (ctx) => MyOrdersScreen(),
        PoliciesScreen.routeName: (ctx) => PoliciesScreen(),
        QuestionsScreen.routeName: (ctx) => QuestionsScreen(),
        ContactUsScreen.routeName: (ctx) => ContactUsScreen(),
        OffersScreen.routeName : (ctx) => OffersScreen(),
      },
    ),
  )
      //),
      );
}
