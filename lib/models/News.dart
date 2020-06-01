import 'package:flutter/material.dart';

class News {
  final String id;
  final String title;
  final String titleEnglish;
  final String text;
  final String textEnglish;
  final String date;
  final String postImage;

  News({
    this.id,
    this.title,
    this.titleEnglish,
    this.text,
    this.textEnglish,
    this.date,
    this.postImage,
  });
}
