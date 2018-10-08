import 'package:flutter/material.dart';

import 'package:demo_quiz_app/utils/question.dart';
import 'package:demo_quiz_app/utils/quiz.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Expanded(
                child: new Material(
                  color: Colors.greenAccent,
                  child: new InkWell(
                    child: new Center(
                      child: new Container(
                        child: new Text("True"),
                      ),
                    ),
                  ),
                ),
            ),
            new Expanded(
              child: new Material(
                color: Colors.redAccent,
                child: new InkWell(
                  child: new Center(
                    child: new Container(
                      child: new Text("False"),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

}