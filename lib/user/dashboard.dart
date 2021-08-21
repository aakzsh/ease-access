import 'package:easeaccess/main.dart';
import 'package:easeaccess/user/newQuestion.dart';
import 'package:easeaccess/user/tips.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  String username = "";
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
                decoration: BoxDecoration(
                    color: maintext, borderRadius: BorderRadius.circular(20)),
                width: w - 40,
                child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Hey, $doc",
                              style: GoogleFonts.poppins(
                                  fontSize: 25, color: mainbg),
                            ),
                          ],
                        ),
                        Text(
                          "Here, you can:\n> Ask Questions about handling devices.\n> View your previous questions.\n> Get some common tips",
                          style:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
                        )
                      ],
                    ))),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewQuestion()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: maintext,
                          borderRadius: BorderRadius.circular(10)),
                      height: 140,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add,
                            size: 50,
                            color: mainbg,
                          ),
                          Text(
                            "    ASK A\nQUESTION",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewQuestion()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: maintext,
                          borderRadius: BorderRadius.circular(10)),
                      height: 140,
                      width: 150,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.note,
                            size: 50,
                            color: mainbg,
                          ),
                          Text(
                            "VIEW YOUR\nQUESTIONS",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      doc = prefs.toString();
                      await prefs.setString('doc', "");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: maintext,
                            borderRadius: BorderRadius.circular(10)),
                        height: 60,
                        width: 150,
                        child: Center(
                          child: Text(
                            "logout",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tips()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: maintext,
                            borderRadius: BorderRadius.circular(10)),
                        height: 60,
                        width: 150,
                        child: Center(
                          child: Text(
                            "Tips",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
