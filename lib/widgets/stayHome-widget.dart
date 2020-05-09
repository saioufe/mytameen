import 'package:flutter/material.dart';

class StayHomeWidget extends StatelessWidget {
  final AnimationController animationController;
  final Animation animation;

  StayHomeWidget({
    this.animationController,
    this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Theme.of(context).primaryColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).bottomAppBarColor.withOpacity(0.2),
            offset: Offset(2.0, 3.0),
            blurRadius: 1.4,
          ),
        ],
      ),
      child: Center(
        child: Text(
          "خلك بامان ... خلك بلبيت",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
