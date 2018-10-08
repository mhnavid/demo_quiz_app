import 'package:flutter/material.dart';

import 'package:demo_quiz_app/utils/question.dart';
import 'package:demo_quiz_app/utils/quiz.dart';
import 'package:demo_quiz_app/ui/answer_button.dart';
import 'package:demo_quiz_app/ui/question_text.dart';

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
            new AnswerButton(true, () => "True"),
            new QuestionText("Pizza", 1),
            new AnswerButton(false, () => "false")
          ],
        )
      ],
    );
  }

}