import 'package:flutter/material.dart';

class PressedServiceImageScreen extends StatelessWidget {
  static const routeName = '/service_pressed_screen';

  @override
  Widget build(BuildContext context) {
    final image = ModalRoute.of(context).settings.arguments as FadeInImage;

    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Container(child: image),
      ),
    );
  }
}
