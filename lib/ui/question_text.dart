import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget{

  final String _question;
  final int _questionNummber;

  QuestionText(this._question, this._questionNummber);
  @override
  State createState() => new QuestionTextState();
}

class QuestionTextState extends State<QuestionText> with SingleTickerProviderStateMixin{

  Animation<double> _fontSizeAnimation;
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(duration: new Duration(microseconds: 500), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(parent: _fontSizeAnimationController, curve: Curves.linear);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.white,
      child: new Padding(
        padding: new EdgeInsets.symmetric(vertical: 20.0),
        child: new Center(
          child: new Text(
            widget._questionNummber.toString() + ": " + widget._question,
            style: new TextStyle(color: Colors.black54, fontSize: _fontSizeAnimation.value*15),
          ),
        ),
      ),
    );
  }

}