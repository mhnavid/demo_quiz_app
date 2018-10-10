import 'package:flutter/material.dart';

import 'package:demo_quiz_app/utils/question.dart';
import 'package:demo_quiz_app/utils/quiz.dart';
import 'package:demo_quiz_app/ui/answer_button.dart';
import 'package:demo_quiz_app/ui/question_text.dart';
import 'package:demo_quiz_app/ui/correct_wrong_overlay.dart';
import 'package:demo_quiz_app/pages/score_page.dart';

class QuizPage extends StatefulWidget{

  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon Musk is human.", false),
    new Question("Pizza is healthy", true),
    new Question("Flutter is awesome", false),
    new Question("This app is awesome", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)),
            new QuestionText(questionText, questionNumber),
            new AnswerButton(false, () => handleAnswer(false)),
          ],
        ),
        overlayShouldBeVisible == true ? new CorrectWrongOverlay (
            isCorrect,
            () {
              if(quiz.length == questionNumber){
                Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
                return;
              }
              currentQuestion = quiz.nextQuestion;
              this.setState(() {
                overlayShouldBeVisible = false;
                questionText = currentQuestion.question;
                questionNumber = quiz.questionNumber;
              });
            }
        ) : new Column()
      ],
    );
  }

}