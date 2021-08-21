import 'package:easeaccess/main.dart';
import 'package:easeaccess/volunteer/profile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    x();
    return Scaffold(
      body: Container(
        color: mainbg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Dashboard",
                    style: GoogleFonts.poppins(color: maintext, fontSize: 40),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: maintext,
                        borderRadius: BorderRadius.circular(20)),
                    width: w - 40,
                    height: 60,
                    child: Center(
                      child: Text(
                        "Hey, $name",
                        style: GoogleFonts.poppins(fontSize: 25, color: mainbg),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: MaterialButton(
                            child: Text(
                              "View Profile",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: maintext),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile()));
                            }))
                  ],
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Unanswered Questions",
                        style:
                            GoogleFonts.poppins(fontSize: 18, color: maintext),
                      ),
                    ),
                    Container(
                      height: h - 100,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
