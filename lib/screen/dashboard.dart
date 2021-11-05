import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:work1/config/constant.dart';
import 'package:work1/model/activity.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;

  @override
  void initState() {
    super.initState();
    callActivity();
  }

  void callActivity() async {
    print('hello world');

    var url = Uri.parse("https://www.boredapi.com/api/activity");
    var response = await http.get(url);
    setState(() {
      data = cedFromJson(response.body);
      print(data.activity);
      print(data.type);
      print(data.participants);
      print(data.price);
    });

    print(response.statusCode);
    print(response.body);
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(color: sColor),
              ),
              ListTile(
                title: Text('Video'),
                leading: Icon(Icons.video_collection_rounded),
                onTap: () {
                  print('Menu Video');
                  Navigator.pushNamed(context, 'video');
                },
              ),
              ListTile(
                title: Text('Image'),
                leading: Icon(Icons.image),
                onTap: () {
                  print('Menu Image');
                  Navigator.pushNamed(context, 'image');
                },
              ),
              ListTile(
                title: Text('Location'),
                leading: Icon(Icons.location_on),
                onTap: () {
                  print('Menu Location');
                  Navigator.pushNamed(context, 'location');
                },
              ),
              ListTile(
                title: Text('Store'),
                leading: Icon(Icons.store_mall_directory_rounded),
                onTap: () {
                  print('Menu Store');
                  Navigator.pushNamed(context, 'store');
                },
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.exit_to_app_rounded),
                onTap: () {
                  print('Menu Logout');
                  logout();
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'login');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.api_sharp),
              SizedBox(
                width: 10,
              ),
              Text('Dashboard')
            ],
          ),
        ),
        body: Column(
          children: [
            Text(
              '${data?.activity ?? "กำลังโหลด"}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            Text(
              '${data?.type ?? ""}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.cyanAccent,
              ),
            ),
            Text(
              '${data?.participants ?? ""}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.greenAccent,
              ),
            ),
            Text(
              '${data?.price ?? ""}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.deepOrangeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
