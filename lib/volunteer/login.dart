import 'package:easeaccess/main.dart';
import 'package:easeaccess/volunteer/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VolunteerLogin extends StatefulWidget {
  @override
  _VolunteerLoginState createState() => _VolunteerLoginState();
}

class _VolunteerLoginState extends State<VolunteerLogin> {
  String email, password;
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
                TextField(onChanged: (value) {
                  email = value;
                }),
                TextField(onChanged: (value) {
                  password = value;
                }),
                MaterialButton(
                  onPressed: () async {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password)
                        .then((result) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardVolunteer()),
                      );
                    }).catchError((err) {
                      print(err.message);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text(err.message),
                              actions: [
                                TextButton(
                                  child: Text("Ok"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    });
                  },
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
