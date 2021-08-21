import 'package:easeaccess/main.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int star = 0;
  int remaining = 0;
  @override
  Widget build(BuildContext context) {
    if (coins > 0 && coins < 100) {
      setState(() {
        remaining = 100 - coins;
        star = 1;
      });
    } else if (coins >= 100 && coins < 200) {
      setState(() {
        remaining = 200 - coins;
        star = 2;
      });
    } else if (coins >= 200 && coins < 300) {
      setState(() {
        remaining = 300 - coins;
        star = 3;
      });
    } else if (coins >= 300 && coins < 400) {
      setState(() {
        remaining = 400 - coins;
        star = 4;
      });
    } else if (coins >= 400) {
      setState(() {
        star = 5;
      });
    }

    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Profile",
                      style: GoogleFonts.poppins(color: maintext, fontSize: 40),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: maintext,
                    ),
                    Text(
                      "$name\n$star star volunteer",
                      style: GoogleFonts.poppins(fontSize: 20, color: maintext),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "$coins coins earned",
                      style: GoogleFonts.poppins(color: maintext, fontSize: 25),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: lol(star, remaining),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(20),
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: maintext,
                      height: 60,
                      minWidth: 100,
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut().then((res) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (Route<dynamic> route) => false);
                        });
                      },
                      child: Center(
                        child: Text(
                          "logout",
                          style:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
                        ),
                      )))
            ],
          )
        ],
      ),
      color: mainbg,
    ));
  }
}

lol(int star, int rem) {
  if (star < 5) {
    return Text(
        "earn $rem coins more to become a ${star + 1} star volunteer yay",
        style: GoogleFonts.poppins(color: maintext, fontSize: 15));
  } else {
    return Text("you are our gem volunteer!!",
        style: GoogleFonts.poppins(color: maintext, fontSize: 15));
  }
}
