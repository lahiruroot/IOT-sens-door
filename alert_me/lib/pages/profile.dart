import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  String userID;
  Profile(userID) {
    this.userID = userID;
  }

  @override
  _ProfileState createState() => _ProfileState(userID);
}

class _ProfileState extends State<Profile> {
  _ProfileState(userID) {
    this.userID = userID;
  }

  String userID, name, email, phno;

  @override
  void initState() {
    super.initState();
    print(userID);
    getUserDetails();
  }

  getUserDetails() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        name = documentSnapshot.data()['name'];
        email = documentSnapshot.data()['email'];
        phno = documentSnapshot.data()['phono'];
      });
    });
  }

  final _Name = TextEditingController();
  final _Email = TextEditingController();
  final _Phono = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Image.asset(
          "images/titile1.png",
          height: 150.0,
          width: 151.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 395,
              color: Colors.blue,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 10.0),
                      child: Icon(
                        Icons.person,
                        size: 70,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 10.0),
                    child: Text(
                      'Hello',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 10.0),
                    child: Text(
                      name,
                      style:
                          TextStyle(fontSize: 30, fontStyle: FontStyle.normal),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 10.0),
                          child: Text(
                            'User',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 10.0),
                          child: Text(
                            name,
                            style: TextStyle(
                                fontSize: 23, fontStyle: FontStyle.italic),
                          ),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                    'Edit Name',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  content: Container(
                                    child: TextField(
                                      controller: _Name,
                                      onChanged: (value) {
                                        name = value;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'User'),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (_Name.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text('User Cannot be empty'),
                                            action: SnackBarAction(
                                              label: 'ok',
                                              onPressed: () {},
                                            ),
                                          ));
                                        } else {
                                          FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(userID)
                                              .update({
                                            'name': name,
                                          }).then((value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'User changed Successfull'),
                                              action: SnackBarAction(
                                                label: 'ok',
                                                onPressed: () {},
                                              ),
                                            ));
                                            getUserDetails();
                                            Navigator.pop(context);
                                          });
                                        }
                                      },
                                      child: const Text('Change'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        'Dismiss',
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      child: Text('Change')),
                ],
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            SizedBox(
              height: 3.0,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 10.0),
                          child: Text(
                            'Email',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 10.0),
                          child: Text(
                            email,
                            style: TextStyle(
                                fontSize: 23, fontStyle: FontStyle.italic),
                          ),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text(
                                    'Edit Email',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  content: Container(
                                    child: TextField(
                                      controller: _Email,
                                      onChanged: (value) {
                                        email = value;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Email'),
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        if (_Email.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text('Email Cannot be empty'),
                                            action: SnackBarAction(
                                              label: 'ok',
                                              onPressed: () {},
                                            ),
                                          ));
                                        } else {
                                          FirebaseFirestore.instance
                                              .collection('Email')
                                              .doc(userID)
                                              .update({
                                            'Email': email,
                                          }).then((value) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                              content: Text(
                                                  'Email changed Successfull'),
                                              action: SnackBarAction(
                                                label: 'ok',
                                                onPressed: () {},
                                              ),
                                            ));
                                            getUserDetails();
                                            Navigator.pop(context);
                                          });
                                        }
                                      },
                                      child: const Text('Change'),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        'Dismiss',
                                      ),
                                    ),
                                  ],
                                ));
                      },
                      child: Text('Change')),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
