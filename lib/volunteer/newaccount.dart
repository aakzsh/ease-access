import 'package:easeaccess/volunteer/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewAccount extends StatefulWidget {
  @override
  _NewAccountState createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
  String email, name, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Text("Volunteer\nSign-Up"),
          TextField(
            onChanged: (value) {
              name = value;
            },
          ),
          TextField(
            onChanged: (value) {
              email = value;
            },
          ),
          TextField(
            onChanged: (value) {
              password = value;
            },
          ),
          MaterialButton(
            onPressed: () async {
              await FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: email, password: password)
                  .then((value) {
                if (value.user != null) {
                  FirebaseFirestore.instance
                      .collection("volunteers")
                      .doc(value.user?.uid)
                      .set({
                    "name": name,
                    "coins": 0,
                    "email": email,
                  });
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardVolunteer(),
                      ));
                }
              }).catchError((err) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text(err.message),
                        actions: [
                          TextButton(
                            child: Text("okay"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    });
              });
            },
            child: Text("Signup"),
          )
        ],
      ),
    ));
  }
}
