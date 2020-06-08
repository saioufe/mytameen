import 'package:flutter/material.dart';
import 'package:my_tameen/models/companies.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:provider/provider.dart';

class CompanyTemplate extends StatefulWidget {
  final PageController c;
  final Companies company;
  final bool isLast;
  CompanyTemplate({this.c, this.company, this.isLast});
  @override
  _CompanyTemplateState createState() => _CompanyTemplateState();
}

class _CompanyTemplateState extends State<CompanyTemplate> {
  @override
  Widget build(BuildContext context) {
    final allOrder = Provider.of<Ordering>(context, listen: false);

    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 2.0,
      //margin: EdgeInsets.all(16.0),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FadeInImage(
                  placeholder: AssetImage('assets/images/placeholder.png'),
                  width: 100,
                  height: 100,
                  image: NetworkImage(
                    "${Ordering.hostName}/images/companies/${widget.company.logo}",
                  ),
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 200,
                  child: Center(
                    child: Text(
                      widget.company.name_english,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'tajawal',
                          fontSize: 19,
                          color: Theme.of(context).bottomAppBarColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "${widget.company.price.toStringAsFixed(2)} KWD",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "المميزات",
                    style:
                        TextStyle(fontFamily: 'tajawal', color: Colors.white),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("تفاصيل الشركة"),
                          content: Text(
                            widget.company.toc_arabic,
                            textAlign: TextAlign.center,
                          ),
                          actions: [],
                        );
                      },
                    );
                  },
                ),
                widget.isLast == false
                    ? FlatButton(
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          "اختيار",
                          style: TextStyle(
                              fontFamily: 'tajawal', color: Colors.white),
                        ),
                        onPressed: () {
                          allOrder.selectedCompany = widget.company;
                          allOrder.totalPrice = widget.company.price;
                          widget.c.jumpToPage(2);
                        },
                      )
                    : SizedBox(
                        width: 0.1,
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
