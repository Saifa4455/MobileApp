import 'package:flutter/material.dart';
import 'package:work1/backend/database.dart';
import 'package:work1/config/constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name, surname, email, password;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          backgroundColor: sColor,
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtName(),
                txtsurName(),
                txtEmail(),
                txtPassword(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 5, 40, 5),
      child: TextFormField(
        style: TextStyle(
          color: sColor,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'Name',
          icon: Icon(Icons.people_outline_rounded),
          hintText: 'Input your name',
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return 'กรุณากรอกข้อมูล';
          } else if (val.length < 3) {
            return 'กรุณากรอกข้อมูลมากกว่า 3 ตัวอักษร';
          }
        },
        onSaved: (val) {
          name = val!.trim();
        },
      ),
    );
  }

  Widget txtsurName() {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: TextFormField(
        style: TextStyle(
          color: sColor,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'Surname',
          icon: Icon(Icons.people_outline_rounded),
          hintText: 'Input your surname',
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return 'กรุณากรอกข้อมูล';
          } else if (val.length < 3) {
            return 'กรุณากรอกข้อมูลมากกว่า 3 ตัวอักษร';
          }
        },
        onSaved: (val) {
          surname = val!.trim();
        },
      ),
    );
  }

  Widget txtEmail() {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: TextFormField(
        style: TextStyle(
          color: sColor,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'Email',
          icon: Icon(Icons.mail_outline),
          hintText: 'Input your email',
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (val) {
          if (!(val!.contains('@'))) {
            return 'กรุณากรอกข้อมูลตามรูปอีเมล abc@def.ght';
          } else if (!(val.contains('.'))) {
            return 'กรุณากรอกข้อมูลตามรูปอีเมล abc@def.ght';
          }
        },
        onSaved: (val) {
          email = val!.trim();
        },
      ),
    );
  }

  Widget txtPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: TextFormField(
        style: TextStyle(
          color: sColor,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          labelText: 'Password',
          icon: Icon(Icons.lock_outline_rounded),
          hintText: 'Input your password',
        ),
        obscureText: true,
        validator: (val) {
          if (val!.isEmpty) {
            return 'กรุณากรอกรหัสผ่าน';
          } else if (val.length < 8) {
            return 'กรุณากรอกรหัสผ่านมากกว่า 8 ตัวอักษร';
          }
        },
        onSaved: (val) {
          password = val!.trim();
        },
      ),
    );
  }

  Widget btnSubmit() {
    return ElevatedButton(
      child: Text(
        'Submit',
      ),
      onPressed: () {
        if (formkey.currentState!.validate()) {
          formkey.currentState!.save();
          var local = LocalDB();
          local.Register(name, surname, email, password);
          Navigator.pushNamed(context, 'login');
        }

        
      },
    );
  }
}
