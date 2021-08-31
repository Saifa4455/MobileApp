import 'package:flutter/material.dart';
import 'package:work1/config/constant.dart';
import 'package:work1/screen/homepage.dart';
import 'package:work1/index.dart';
import 'package:work1/screen/login.dart';
import 'package:work1/screen/register.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KMUTNB',
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
        scaffoldBackgroundColor: bColor,
      ),
      routes: {
        'login': (context) => Login(),
        'register': (context) => Register(),
      },
      home: Index(),
    );
  }
}
