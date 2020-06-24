import 'package:flutter/material.dart';
import 'package:my_tameen/models/orders.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:my_tameen/providers/ordering.dart';
import 'package:my_tameen/widgets/myorders-template.dart';
import 'package:provider/provider.dart';

class MyOrdersScreen extends StatefulWidget {
  static const routeName = '/myOrders_screen';

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final allOrder = Provider.of<Ordering>(context, listen: false);
    final lang = Provider.of<Languages>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          title: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              lang.translation['myorders'][Languages.selectedLanguage],
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "tajawal",
                  color: Colors.white,
                  fontSize: 28),
            ),
          ),
        ),
        body: FutureBuilder(
            future: allOrder.fetchDataOrders(),
            builder: (ctx, authResultSnap) {
              if (authResultSnap.connectionState == ConnectionState.waiting) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (authResultSnap.hasError) {
                print(authResultSnap.error);
                return RaisedButton(
                  onPressed: () {
                    setState(() {
                      //other.getUserLocation();
                    });
                  },
                  child: Text("تفقد من الاتصال بلانترنت",
                      style: TextStyle(color: Colors.black)),
                );
              } else {
                return Template(allOrder: allOrder);
              }
            }));
  }
}

class Template extends StatelessWidget {
  const Template({
    Key key,
    @required this.allOrder,
  }) : super(key: key);

  final Ordering allOrder;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          color: Theme.of(context).canvasColor,
          child: Column(
              children: allOrder.orders.reversed.map((item) {
            return MyOrdersTemplate(
              order: Orders(
                id: item.id,
                name: item.name,
                orderType: item.orderType,
                price: item.price,
                startDate: item.startDate,
                status: item.status,
              ),
            );
          }).toList()),
        ),
      ),
    );
  }
}
