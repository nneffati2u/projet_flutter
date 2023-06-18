import 'package:flutter/material.dart';
import 'package:projet_flutter/constants.dart';

class Questionwidget extends StatelessWidget {
  const Questionwidget(
      {Key key, this.questions, this.indexAction, this.totalQuestions})
      : super(key: key);

  final String questions;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        'Question ${indexAction + 1}/$totalQuestions: $questions',
        style: const TextStyle(
          fontSize: 24.0,
          color: neutral,
        ),
      ),
    );
  }
}
