import 'package:easeaccess/main.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      body: Column(
        children: <Widget>[
          Text("Profile"),
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: maintext,
              ),
              Text("$name\n$star star volunteer"),
            ],
          ),
          Text("$coins coins earned"),
          lol(star, remaining),
          MaterialButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false);
              });
            },
            child: Text("logout"),
          )
        ],
      ),
    );
  }
}

lol(int star, int rem) {
  if (star < 5) {
    return Text("earn $rem coins more to become a ${star + 1} yay");
  } else {
    return Text("you are our gem volunteer!!");
  }
}
