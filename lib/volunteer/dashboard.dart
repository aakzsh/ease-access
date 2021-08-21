import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardVolunteer extends StatefulWidget {
  @override
  _DashboardVolunteerState createState() => _DashboardVolunteerState();
}

String name;
int coins;

class _DashboardVolunteerState extends State<DashboardVolunteer> {
  void x() {
    FirebaseFirestore.instance
        .collection('volunteers')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      {
        if (value.exists) {
          setState(() {
            name = "${(value.data()["name"])}";
            coins = (value.data()["coins"]);
          });
          // print('Document data: ${(value.data()["name"])}');
        } else {
          print('Document does not exist on the database');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    x();
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Text("Hey, $name"),
            )
          ],
        ),
      ),
    );
  }
}
