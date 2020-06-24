import 'package:flutter/material.dart';

class Promocode {
  final String id;
  final String name;
  final String range;
  final List<String> amount;
  Promocode({
    this.id,
    this.name,
    @required this.range,
    this.amount,
  });
}
