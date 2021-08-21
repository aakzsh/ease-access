import 'package:easeaccess/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VolunteerLogin extends StatefulWidget {
  @override
  _VolunteerLoginState createState() => _VolunteerLoginState();
}

class _VolunteerLoginState extends State<VolunteerLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: mainbg,
        child: Column(
          children: <Widget>[
            Text(
              "Volunteer\nLogin",
              style: GoogleFonts.poppins(color: maintext, fontSize: 20),
            ),
            Column(
              children: <Widget>[
                Container(),
                Container(),
                MaterialButton(
                  onPressed: () {},
                  child: Text("login"),
                )
              ],
            ),
            MaterialButton(
              onPressed: () {},
              child: Row(
                children: <Widget>[
                  Text("new to ease-access? ",
                      style:
                          GoogleFonts.poppins(fontSize: 13, color: maintext)),
                  Text("sign-Up",
                      style: GoogleFonts.poppins(
                          fontSize: 13, color: Colors.purple)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
