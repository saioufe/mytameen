import 'package:flutter/material.dart';
import 'package:my_tameen/models/News.dart';
import 'package:my_tameen/models/offers.dart';
import 'package:my_tameen/screens/pressed-news-screen.dart';
import 'package:my_tameen/screens/pressed-offers-screen.dart';
import 'package:provider/provider.dart';
import '../providers/allProvider.dart';

class OffersTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allPosts = Provider.of<AllProvider>(context, listen: false);
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 3.55,
      child: Column(
          children: allPosts.offers.map((item) {
        return Template(
          offers: Offers(
            id: item.id,
            title: item.title,
            text: item.text,
            date: item.date,
            image: item.image,
          ),
        );
      }).toList()),
    );
  }
}

class Template extends StatelessWidget {
  final Offers offers;
  const Template({
    Key key,
    @required this.offers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(OffersPressedScreen.routeName, arguments: offers);
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10.0,
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Hero(
                tag: offers.id,
                child: FadeInImage(
                  placeholder: AssetImage('assets/images/car.jpg'),
                  height: MediaQuery.of(context).size.height * 0.35,
                  image: NetworkImage(
                      "${AllProvider.hostName}/images/offers/${offers.image}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  // GestureDetector(
                  //   onTap: () {
                  //     print("clicked");
                  //   },
                  //   child: Icon(Icons.share,
                  //       color: Theme.of(context).bottomAppBarColor),
                  // ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  offers.title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontFamily: 'tajawal',
                      fontSize: 20,
                      color: Theme.of(context).bottomAppBarColor,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0, top: 5),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.7,
                child: Center(
                  child: Text(
                    offers.date,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontFamily: 'tajawal',
                      color:
                          Theme.of(context).bottomAppBarColor.withOpacity(0.5),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
