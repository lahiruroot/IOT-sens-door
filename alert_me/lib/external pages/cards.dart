import 'package:alert_me/pages/stet_time.dart';
import 'package:alert_me/pages/devicelist.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

final _device = TextEditingController();

Widget cardlist(context) {
  var roundedRectangleBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
  );
  return Container(
    height: 170,
    width: 750,
    child: PageView(
      controller: PageController(viewportFraction: 0.8),
      scrollDirection: Axis.horizontal,
      pageSnapping: true,
      children: <Widget>[
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.pink,
          shape: roundedRectangleBorder,
          child: Column(
            children: <Widget>[
              const ListTile(
                leading: Icon(
                  Icons.router,
                  size: 60,
                  color: Colors.white,
                ),
                title: Text('Add New Device.',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => setTime1()));
                    },
                    icon: Icon(
                      Icons.add,
                      size: 46,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Add Device",
                      style: TextStyle(fontSize: 23, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: <Widget>[
              const ListTile(
                leading: Icon(
                  Icons.timer,
                  size: 50,
                  color: Colors.white,
                ),
                title: Text('Active Device',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                subtitle: Text('Number of online device',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.italic)),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text('02',
                      style: TextStyle(color: Colors.white, fontSize: 32)),
                ],
              )
            ],
          ),
        ),
      ],
    ),
  );
}
