import 'package:flutter/material.dart';
import 'package:work1/config/constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          backgroundColor: sColor,
        ),
      ),
    );
  }
}
