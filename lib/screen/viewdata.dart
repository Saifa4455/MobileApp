import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  final dbfirebase = FirebaseDatabase.instance.reference().child('store');

  Future<void> updateData(String key) async {
    dbfirebase.child(key).update({
      'status': 'ขายแล้ว',
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.flatware_rounded),
                  ),
                  title: Text('${snapshot.value['name']}'),
                  subtitle: Row(
                    children: [
                      Text('ราคา ' + '${snapshot.value['price']}' + ' บาท '),
                      Text('สถานะ ' + '${snapshot.value['status']}')
                    ],
                  ),
                  trailing: Column(
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.delete_rounded),
                          onPressed: () {
                            print(snapshot.key);
                            dbfirebase.child(snapshot.key!).remove();
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.update_rounded),
                          onPressed: () {
                            updateData(snapshot.key!);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
