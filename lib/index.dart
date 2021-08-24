import 'package:flutter/material.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        // color: Colors.blue,
        child: ListView(
          children: [
            Image.asset(
              "asset/image/logo_kmutnb.png",
              width: size.width * 0.2,
              height: size.height * 0.2,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Welcome to KMUTNB',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrangeAccent,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Image(
              image: NetworkImage(
                  'https://softsuave-assets.s3.amazonaws.com/images/2020/mobile/mobile-cont.png'),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  primary: Colors.amber[900],
                  padding: EdgeInsets.all(12.0),
                  shape: StadiumBorder()),
              child: Text('Login'),
              onPressed: () {
                print("Login!!");
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  primary: Colors.amber[900],
                  padding: EdgeInsets.all(12.0),
                  shape: StadiumBorder()),
              child: Text('Sign In'),
              onPressed: () {
                print("Sign In!!");
              },
            ),
          ],
        ),
      ),
    );
  }
}
