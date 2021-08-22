import 'package:easeaccess/main.dart';
import 'package:easeaccess/user/newQuestion.dart';
import 'package:easeaccess/volunteer/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard.dart';

class OldQuestions extends StatefulWidget {
  @override
  _OldQuestionsState createState() => _OldQuestionsState();
}

List<dynamic> personalQues;
void calc() {
  for (int i = 0; i < queslist.length; i++) {
    if (queslist[i]['by'] == username) {
      personalQues.add(queslist[i]);
    }
  }
}

class _OldQuestionsState extends State<OldQuestions> {
  @override
  Widget build(BuildContext context) {
    calc();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: mainbg,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Your Questions",
                    style: GoogleFonts.poppins(color: maintext, fontSize: 40),
                  ),
                )
              ],
            ),
            Container(
              height: h - 150,
              child: ListView.builder(
                itemCount: personalQues.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: maintext,
                        borderRadius: BorderRadius.circular(20)),
                    width: w - 40,
                    height: 100,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            personalQues[index]['title']
                                .toString()
                                .substring(0, 20),
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            MaterialButton(
                                child: Text(
                                  txtdec(personalQues[index]['isanswered']),
                                  style:
                                      GoogleFonts.poppins(color: Colors.white),
                                ),
                                color:
                                    coldec(personalQues[index]['isanswered']),
                                onPressed: () {})
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

coldec(bool lol) {
  if (lol == true) {
    return Colors.green;
  } else {
    return Colors.red;
  }
}

txtdec(bool lmao) {
  if (lmao == true) {
    return "view answer";
  } else {
    return "no answer yet";
  }
}
