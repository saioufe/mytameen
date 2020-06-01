import 'package:flutter/material.dart';
import 'package:my_tameen/models/News.dart';
import 'package:my_tameen/models/offers.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:provider/provider.dart';
//import 'package:reviews_slider/reviews_slider.dart';
import '../providers/allProvider.dart';

class OffersPressedScreen extends StatefulWidget {
  static const routeName = '/offers_pressed_screen';

  @override
  _OffersPressedScreenState createState() => _OffersPressedScreenState();
}

class _OffersPressedScreenState extends State<OffersPressedScreen> {
  @override
  void initState() {
    //postRequest('https://pandoradevs.com/getflutter.php');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newsData = ModalRoute.of(context).settings.arguments as Offers;

    //final loadedNews = Provider.of<OthersProvider>(context).findById(productId);
    //final List<String> texts = loadedNews.text.split("*");
    //final Widget test = loadedNews.test;
    //print(test);
    //final lang = Provider.of<Languages>(context, listen: false);
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(loadedProduct.title),
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              backgroundColor: Theme.of(context).primaryColor,
              iconTheme: IconThemeData(color: Colors.white),
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: newsData.id,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/placeholder.png'),
                    height: MediaQuery.of(context).size.height * 0.35,
                    image: NetworkImage(
                        "${AllProvider.hostName}/images/posts/${newsData.image}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          spreadRadius:
                              0.8, // has the effect of extending the shadow
                          offset: Offset(
                            0, // horizontal, move right 10
                            0, // vertical, move down 10
                          ),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  Languages.selectedLanguage == 0
                                      ? newsData.title
                                      : newsData.titleEnglish,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontFamily: 'tajawal',
                                      color:
                                          Theme.of(context).bottomAppBarColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  newsData.date.toString(),
                                  style: TextStyle(
                                      fontFamily: 'tajawal',
                                      color: Theme.of(context).accentColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                        Text(
                          Languages.selectedLanguage == 0
                              ? newsData.text
                              : newsData.textEnglish,
                          textAlign: TextAlign.justify,
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontFamily: 'tajawal',
                              fontSize: 20,
                              color: Theme.of(context).bottomAppBarColor,
                              height: 1.5),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> _requestPop() {
  return new Future.value(true);
}
