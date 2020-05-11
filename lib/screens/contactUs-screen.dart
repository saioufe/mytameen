import 'package:flutter/material.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:provider/provider.dart';

class ContactUsScreen extends StatelessWidget {
  static const routeName = '/contactUs-screen';

  @override
  Widget build(BuildContext context) {
    final lang = Provider.of<Languages>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            lang.translation['contactuss'][Languages.selectedLanguage],
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "tajawal",
                color: Colors.white,
                fontSize: 28),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 0),
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor.withOpacity(0.9),
                  BlendMode.srcOver),
              repeat: ImageRepeat.repeat,
              image: new AssetImage('assets/images/myTameenLogo.png'),
              fit: BoxFit.cover,
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).bottomAppBarColor.withOpacity(0.2),
                offset: Offset(2.0, 3.0),
                blurRadius: 1.4,
              ),
              BoxShadow(
                color: Theme.of(context).bottomAppBarColor.withOpacity(0.2),
                offset: Offset(-2.0, -3.0),
                blurRadius: 1.4,
              ),
              BoxShadow(
                color: Theme.of(context).bottomAppBarColor.withOpacity(0.2),
                offset: Offset(2.0, -3.0),
                blurRadius: 1.4,
              ),
            ],
            color: Theme.of(context).primaryColor,
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(10),
            //   bottomLeft: Radius.circular(10),
            // ),
          ),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/myTameenLogo.png",
                width: 150,
                height: 150,
              ),
              Text(
                "this is the first text",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
