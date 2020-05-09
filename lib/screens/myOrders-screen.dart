import 'package:flutter/material.dart';
import 'package:my_tameen/widgets/myorders-template.dart';

class MyOrdersScreen extends StatelessWidget {
  static const routeName = '/myOrders_screen';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'طلباتي',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "tajawal",
                color:Colors.white,
                fontSize: 28),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Theme.of(context).canvasColor,
            child: Column(
              children: <Widget>[
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                      ),
                    ),
                  ],
                ),
                MyOrdersTemplate(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
