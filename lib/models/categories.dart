import 'package:flutter/material.dart';
import 'package:my_tameen/models/services.dart';

class Categories {
  final String id;
  final String title;
  final String text;
  final String image;
  final List<Services> services;

  Categories({
    this.id,
    this.title,
    this.text,
    this.image,
    this.services,
  });
}
