import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easeaccess/main.dart';
import 'package:easeaccess/user/answer.dart';
import 'package:easeaccess/volunteer/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAnswer extends StatefulWidget {
  int i;
  NewAnswer({Key key, @required this.i}) : super(key: key);
  @override
  _NewAnswerState createState() => _NewAnswerState();
}

class _NewAnswerState extends State<NewAnswer> {
  NewAnswer a;

  String answer, url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: maintext),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: TextField(
                      maxLength: 500,
                      maxLines: 10,
                      // textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                      onChanged: (value) {
                        answer = value;
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
                        hintText: "Type your answer",
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: maintext),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: TextField(
                      maxLength: 100,
                      maxLines: 1,
                      // textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                      onChanged: (value) {
                        url = value;
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
                        hintText: "YouTube video url (optional)",
                      ),
                    ),
                  )),
            ),
            Row(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      width: 100,
                      child: MaterialButton(
                        height: 60,
                        onPressed: () {
                          Map<dynamic, dynamic> lol = {
                            "title": queslist[a.i]['title'],
                            "isanswered": true,
                            "desc": queslist[a.i]['desc'],
                            "by": queslist[a.i]['by'],
                            "answer": answer,
                            "ansurl": url,
                            "datetime": queslist[a.i]['datetime']
                          };
                          FirebaseFirestore.instance
                              .collection('ques')
                              .doc('list')
                              .update({'queslist[a.i]': lol}).then(
                                  (value) => {Navigator.pop(context)});
                        },
                        child: Center(
                            child: Text(
                          "Answer",
                          style:
                              GoogleFonts.poppins(fontSize: 18, color: mainbg),
                        )),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
