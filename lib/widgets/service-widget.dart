import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_tameen/providers/allProvider.dart';
import 'package:my_tameen/screens/pressed-service-image-screen.dart';
import '../models/services.dart';

class ServiceWidget extends StatefulWidget {
  final Services services;
  ServiceWidget({this.services});
  @override
  _ServiceWidgetState createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  List<String> theImages;
  @override
  void initState() {
    doTheImages(widget.services.images);
    super.initState();
  }

  void doTheImages(String images) {
    theImages = images.split(",");
    theImages.removeAt(0);
    print(theImages);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 2.0,
              spreadRadius: 2.0),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            margin: EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: StaggeredGridView.countBuilder(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 2,
              itemCount: theImages.length,
              itemBuilder: (BuildContext context, int index) => new Container(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PressedServiceImageScreen.routeName,
                      arguments: FadeInImage(
                        placeholder:
                            AssetImage('assets/images/placeholder.png'),
                        height: MediaQuery.of(context).size.height * 0.35,
                        image: NetworkImage(
                            "${AllProvider.hostName}/images/services/${theImages[index]}"),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/placeholder.png'),
                    height: MediaQuery.of(context).size.height * 0.35,
                    image: NetworkImage(
                        "${AllProvider.hostName}/images/services/${theImages[index]}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              widget.services.description,
              textAlign: TextAlign.justify,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
