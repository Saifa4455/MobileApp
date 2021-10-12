import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  dynamic latitude = "";
  dynamic longitude = "";

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    // คำสั่งการดึงค่าตำแหน่ง ละติจูด และ ลองติจูด
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var address =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    print(address);

    setState(() {
      latitude = '${location.latitude}';
      longitude = '${location.longitude}';
    });
    print(location);
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Latitude : ' + latitude,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            Text(
              'Longitude : ' + longitude,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
