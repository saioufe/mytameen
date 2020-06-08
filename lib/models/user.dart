import 'package:flutter/material.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final String dateOfJoin;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.dateOfJoin});
}
