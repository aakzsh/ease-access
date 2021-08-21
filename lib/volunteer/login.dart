import 'package:easeaccess/main.dart';
import 'package:easeaccess/volunteer/dashboard.dart';
import 'package:easeaccess/volunteer/newaccount.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Volunteer\nLog-In",
                    style: GoogleFonts.poppins(color: maintext, fontSize: 40),
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: maintext),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                            hintText: "Email",
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: maintext),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: TextField(
                          textAlign: TextAlign.center,
                          style:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            labelStyle: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                            hintText: "Password",
                          ),
                          obscureText: true,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 60,
                    ),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                      height: 60,
                      minWidth: 100,
                      color: maintext,
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
                      child: Center(
                        child: Text(
                          "login",
                          style:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
                        ),
                      ),
                    ))
              ],
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewAccount()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("new to ease-access? ",
                      style:
                          GoogleFonts.poppins(fontSize: 18, color: maintext)),
                  Text("sign-Up",
                      style: GoogleFonts.poppins(
                          fontSize: 18, color: Colors.purple[800])),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
