import 'package:easeaccess/main.dart';
import 'package:easeaccess/user/answer.dart';
import 'package:easeaccess/volunteer/newAnswer.dart';
import 'package:easeaccess/volunteer/profile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expandable/expandable.dart';

class DashboardVolunteer extends StatefulWidget {
  @override
  _DashboardVolunteerState createState() => _DashboardVolunteerState();
}

String name = "", by = "";
int coins = 0;
List<String> list = ["hello"];
List<dynamic> queslist = [];

class _DashboardVolunteerState extends State<DashboardVolunteer> {
  void x() {
    FirebaseFirestore.instance
        .collection("volunteers")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      {
        if (value.exists) {
          setState(() {
            name = "${(value.data()["name"])}";
            coins = int.parse("${(value.data()["coins"])}");
          });
        } else {
          print('Document does not exist on the database');
        }
      }
    });
  }

  void y() {
    FirebaseFirestore.instance
        .collection("ques")
        .doc("list")
        .get()
        .then((value) => {
              if (value.exists)
                {
                  setState(() {
                    queslist = List.from((value.data()["queslist"]));
                  })
                }
              else
                {print("doesnt exist lol")}
            });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    x();
    y();
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
            Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: maintext,
                        borderRadius: BorderRadius.circular(20)),
                    width: w - 40,
                    height: 60,
                    child: Center(
                      child: Text(
                        "Hey, $name",
                        style: GoogleFonts.poppins(fontSize: 25, color: mainbg),
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: MaterialButton(
                            child: Text(
                              "View Profile",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: maintext),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile()));
                            }))
                  ],
                ),
              ],
            ),
            Container(
              // color: Colors.pink,
              height: h - 250,
              child: ListView.builder(
                  itemCount: queslist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ques(
                        index,
                        w,
                        queslist[index]['title'],
                        queslist[index]['desc'],
                        queslist[index]['by'],
                        context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

ques(int i, double w, String title, String desc, String bywho, context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: Container(
        decoration: BoxDecoration(
            color: maintext, borderRadius: BorderRadius.circular(10)),
        width: w - 40,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ExpandablePanel(
              theme: ExpandableThemeData(
                  iconColor: mainbg,
                  expandIcon: Icons.add,
                  iconSize: 40,
                  collapseIcon: Icons.remove),
              header: Text(
                "$title",
                style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
              ),
              collapsed: Text(
                "",
                style: GoogleFonts.poppins(fontSize: 1, color: mainbg),
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "$desc",
                    style: GoogleFonts.poppins(fontSize: 18, color: mainbg),
                    softWrap: true,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewAnswer(i: i)));
                        },
                        child: Text(
                          "Answer This",
                          style: GoogleFonts.poppins(color: maintext),
                        ),
                        height: 60,
                        color: mainbg,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Text(
                        "Asked by\n$bywho",
                        style: GoogleFonts.poppins(color: mainbg, fontSize: 18),
                      )
                    ],
                  )
                ],
              )),
        )),
  );
}
