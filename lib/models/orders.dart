import 'package:flutter/material.dart';

class Orders {
  final String id;
  final String name;
  final String orderType;
  final String price;
  final String startDate;
  final String status;

  Orders({
    this.id,
    this.name,
    this.orderType,
   @required this.price,
    this.startDate,
    this.status,
  });
}
