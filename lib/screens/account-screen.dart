import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Theme.of(context).canvasColor,
        child: Text("this is the account screen"),
      ),
    );
  }
}
