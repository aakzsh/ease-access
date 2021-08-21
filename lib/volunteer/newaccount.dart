import 'package:easeaccess/main.dart';
import 'package:easeaccess/volunteer/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      color: mainbg,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Volunteer\nSign-Up",
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
                        style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                        onChanged: (value) {
                          name = value;
                        },
                        decoration: InputDecoration(
                          labelStyle:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintStyle:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
                          hintText: "Name",
                        ),
                        obscureText: false,
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
                        style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          labelStyle:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintStyle:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
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
                        style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                        onChanged: (value) {
                          password = value;
                        },
                        decoration: InputDecoration(
                          labelStyle:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintStyle:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
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
                            "type": "vol"
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
                    child: Center(
                      child: Text(
                        "signup",
                        style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 2,
          )
        ],
      ),
    ));
  }
}
