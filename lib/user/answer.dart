import 'package:easeaccess/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Answer extends StatefulWidget {
  Map<dynamic, dynamic> l;
  Answer({Key key, @required this.l}) : super(key: key);
  @override
  _AnswerState createState() => _AnswerState();
}

String answerText, answerDesc, answerUrl = "";

class _AnswerState extends State<Answer> {
  Answer x;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          color: mainbg,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Answer",
                        style:
                            GoogleFonts.poppins(color: maintext, fontSize: 40),
                      ),
                    )
                  ],
                ),
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    width: w - 40,
                    color: maintext,
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text(
                        x.l['answer'],
                        style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                      ),
                    )),
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    width: w - 40,
                    color: maintext,
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: SelectableText(
                        x.l['ansurl'],
                        style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Rate this answer",
                      style: GoogleFonts.poppins(fontSize: 18, color: maintext),
                    ),
                    Icon(Icons.thumb_up, size: 50),
                    Icon(Icons.thumb_down, size: 50)
                  ],
                )
              ],
            ),
          )),
    );
  }
}
