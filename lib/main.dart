import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:work1/config/constant.dart';
import 'package:work1/screen/dashboard.dart';
import 'package:work1/screen/firebaseregister.dart';
import 'package:work1/screen/firebaselogin.dart';
import 'package:work1/screen/homepage.dart';
import 'package:work1/screen/store.dart';
import 'package:work1/index.dart';
import 'package:work1/screen/location.dart';
import 'package:work1/screen/login.dart';
import 'package:work1/screen/register.dart';
import 'package:work1/screen/video.dart';
import 'package:work1/screen/image.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
        'login': (context) => FirebaseLogin(),
        'register': (context) => FirebaseRegister(),
        'dashboard': (context) => Dashboard(),
        'video': (context) => Video(),
        'image': (context) => Imagemenu(),
        'location': (context) => Location(),
        'store': (context) => Store(),
      },
      home: Index(),
    );
  }
}
