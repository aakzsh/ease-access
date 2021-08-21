import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easeaccess/user/dashboard.dart';
import 'package:easeaccess/volunteer/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'volunteer/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

String doc = "";

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

Color mainbg = Color.fromRGBO(242, 170, 76, 1);
Color maintext = Color.fromRGBO(16, 24, 32, 1);

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ease Access',
        theme: theme,
        darkTheme: darkTheme,
        home: Select(),
      ),
    );
  }
}

class Select extends StatefulWidget {
  @override
  _SelectState createState() => _SelectState();
}

class _SelectState extends State<Select> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      return DashboardVolunteer();
    } else {
      if (FirebaseAuth.instance.currentUser.email
              .substring(FirebaseAuth.instance.currentUser.email.length - 4) ==
          "@e.c") {
        return UserDashboard();
      } else {
        return DashboardVolunteer();
      }
    }
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    String username = "test";
    return Scaffold(
      body: Container(
          color: mainbg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    "assets/logobig.png",
                    height: 200,
                    width: 200,
                  ),
                  Text(
                    "Ease-Access",
                    style: GoogleFonts.poppins(
                        color: maintext,
                        fontSize: 45,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "tech made easy and accessible",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: maintext,
                    ),
                  ),
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
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                            onChanged: (value) {
                              username = value;
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
                              hintText: "Enter Username",
                            ),
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
                          FirebaseFirestore.instance
                              .collection("users")
                              .doc(username)
                              .get()
                              .then((value) => {
                                    if (value.exists)
                                      {
                                        FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email: "$username@e.c",
                                                password: "easeaccess")
                                            .then((value) => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UserDashboard())))
                                      }
                                    else
                                      {
                                        FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: "$username@e.c",
                                                password: "easeaccess")
                                            .then((value) {
                                          if (value.user != null) {
                                            FirebaseFirestore.instance
                                                .collection("users")
                                                .doc(username)
                                                .set({
                                              "username": username,
                                              "type": "general",
                                              "questions": []
                                            });
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      UserDashboard(),
                                                ));
                                          }
                                        }).catchError((err) {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text("Error"),
                                                  content: Text(err.message),
                                                  // content:
                                                  //     Text("Invalid content, try again!"),
                                                  actions: [
                                                    TextButton(
                                                      child: Text("okay"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    )
                                                  ],
                                                );
                                              });
                                        })
                                      }
                                  });
                        },
                        child: Center(
                          child: Text(
                            "login",
                            style: GoogleFonts.poppins(
                                fontSize: 18, color: mainbg),
                          ),
                        ),
                      ))
                ],
              ),
              MaterialButton(
                minWidth: 200,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VolunteerLogin()));
                },
                child: Text(
                  "login as a volunteer instead",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: maintext,
                  ),
                ),
              ),
              // MaterialButton(
              //     child: Text("lol"),
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => UserDashboard()));
              //     })
            ],
          )),
    );
  }
}
