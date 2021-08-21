import 'package:easeaccess/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewQuestion extends StatefulWidget {
  @override
  _NewQuestionState createState() => _NewQuestionState();
}

class _NewQuestionState extends State<NewQuestion> {
  String title, desc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Ask New\nQuestion",
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
                      maxLength: 100,
                      maxLines: 2,
                      // textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                      onChanged: (value) {
                        title = value;
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
                        hintText: "Title",
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
                      maxLength: 500,
                      maxLines: 10,
                      // textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                      onChanged: (value) {
                        desc = value;
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
                        hintText: "Description",
                      ),
                    ),
                  )),
            ),
            Text(
              "or",
              style: GoogleFonts.poppins(fontSize: 18, color: maintext),
            ),
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 60,
              color: maintext,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Record Audio",
                    style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                  ),
                  Icon(Icons.mic_rounded, size: 50, color: mainbg)
                ],
              ),
            ),
            MaterialButton(
              height: 40,
              minWidth: 80,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: maintext,
              onPressed: () {},
              child: Text("Ask",
                  style: GoogleFonts.poppins(fontSize: 18, color: mainbg)),
            )
          ],
        ),
      ),
    );
  }
}
