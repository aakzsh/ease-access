import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'volunteer/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

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
        brightness: Brightness.light,
        primarySwatch: Colors.amber,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
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
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: mainbg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset("assets/logo.png"),
                  Text(
                    "Ease-Access",
                    style: GoogleFonts.poppins(fontSize: 30),
                  ),
                  Text(
                    "tech made easy and accessible",
                    style: GoogleFonts.poppins(fontSize: 13),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                    color: maintext,
                    child: Center(
                      child: TextField(),
                    ),
                  ),
                  MaterialButton(
                    height: 50,
                    minWidth: 180,
                    color: maintext,
                    onPressed: () {},
                    child: Center(
                      child: Text(
                        "login",
                        style: GoogleFonts.poppins(fontSize: 13, color: mainbg),
                      ),
                    ),
                  )
                ],
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VolunteerLogin()));
                },
                child: Text("login as a volunteer instead",
                    style: GoogleFonts.poppins(fontSize: 13, color: maintext)),
              ),
            ],
          )),
    );
  }
}
