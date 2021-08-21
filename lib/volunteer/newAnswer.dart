import 'package:flutter/material.dart';

class NewAnswer extends StatefulWidget {
  @override
  _NewAnswerState createState() => _NewAnswerState();
}

class _NewAnswerState extends State<NewAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Answer\nQuestion"),
            TextField(),
            TextField(),
            MaterialButton(
              onPressed: () {},
              child: Text("Answer"),
            )
          ],
        ),
      ),
    );
  }
}
