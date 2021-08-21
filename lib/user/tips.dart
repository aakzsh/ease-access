import 'package:easeaccess/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tips extends StatefulWidget {
  @override
  _TipsState createState() => _TipsState();
}

class _TipsState extends State<Tips> {
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
                    "Common Tips",
                    style: GoogleFonts.poppins(color: maintext, fontSize: 40),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: w - 10,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "> Choose strong passwords\n> When in doubt, ask on our platform\n> Keep your antivirus software up to date\n> Change your settings for easy reading\n> Add contacts for family and friends\n> Don’t reply to emails from people you don’t know\n> Be careful when you click on a link or attachment\n> Avoid oversharing",
                      style: GoogleFonts.poppins(color: maintext, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
