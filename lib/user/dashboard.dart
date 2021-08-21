import 'package:easeaccess/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  String username = "";
  @override
  Widget build(BuildContext context) {
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
            Container(
                child: Column(
              children: <Widget>[
                Text("Hey, $username"),
                Text(
                    "Here, you can:\n> Ask Questions about handling devices.\n> View your previous questions.\n> Get some common tips")
              ],
            )),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 140,
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: mainbg,
                        ),
                        Text("ASK A\nQUESTION"),
                      ],
                    ),
                  ),
                  Container(
                    height: 140,
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.book,
                          color: mainbg,
                        ),
                        Text("VIEW YOUR\nQUESTIONS"),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Text("LOGOUT"),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Text("SOME\nCOMMON\nTIPS"),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
